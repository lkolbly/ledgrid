module mojo_top(
	// 50MHz clock input
	input clk_in,
	// Input from reset button (active low)
	input rst_n,
	// cclk input from AVR, high when AVR is ready
	input cclk,
	// Outputs to the 8 onboard LEDs
	output[7:0]led,
	// AVR SPI connections
	output spi_miso,
	input spi_ss,
	input spi_mosi,
	input spi_sck,
	// AVR ADC channel select
	output [3:0] spi_channel,
	// Serial connections
	input avr_tx, // AVR Tx => FPGA Rx
	output avr_rx, // AVR Rx => FPGA Tx
	input avr_rx_busy, // AVR Rx buffer full
	
	output oe_n,
	output rclk,
	output srclk,
	output srclr_n,
	output [35:0] ser,
	
	output testSerCol,
	output testSerRow
);

wire oe, srclr;
assign oe_n = ~oe;
assign srclr_n = ~srclr;

wire rst = ~rst_n; // make reset active high

assign testSerCol = ser[35];
assign testSerRow = ser[34];

wire clk;
clk_wiz_v3_6 clk_wiz(
	.CLK_IN1(clk_in),
	.CLK_OUT1(clk), // 100MHz
	.RESET(rst),
	.LOCKED()
);

reg fb_wea;
reg [12:0] fb_addra;
reg [7:0] fb_dina;

reg [12:0] fb_addr_offset;

wire [12:0] fb_addrb;
wire [7:0] fb_doutb;

fb_ram_8x5184 fbram(
	.clka(clk),
	.wea(fb_wea),
	.addra(fb_addra),
	.dina(fb_dina),
	.douta(),
	
	.clkb(clk),
	.web(1'b0),
	.addrb(fb_addrb + fb_addr_offset),
	.dinb(8'b0),
	.doutb(fb_doutb)
);

reg driver_debug_clk, driver_debug_en;
reg [7:0] driver_debug_data;
wire [35:0] ser;
shift_driver driver(
	.clk(clk),
	.rst(rst),
	.fb_addr(fb_addrb),
	.fb_data(fb_doutb),
	
	.debug_data_in(driver_debug_data),
	.debug_clk_in(driver_debug_clk),
	.debug_en(driver_debug_en),
	
	.oe(oe),
	.rclk(rclk),
	.srclk(srclk),
	.srclr(srclr),
	.ser(ser)
);

wire [7:0] tx_data;
wire new_tx_data;
wire tx_busy;
wire [7:0] rx_data;
wire new_rx_data;

wire [7:0] next_rx_data;
reg pop_rx_data;
//wire [7:0] queued_rx_data;
wire [7:0] rx_data_count;

wire [7:0] rx_data_dout;
wire rx_data_valid, rx_data_underflow;
wire has_rx_data = rx_data_valid && !rx_data_underflow;

serial_fifo serial_in(
	.clk(clk),
	.rst(rst),
	.din(rx_data),
	.wr_en(new_rx_data),
	.rd_en(pop_rx_data),
	.dout(rx_data_dout),
	.full(),
	.empty(),
	.valid(rx_data_valid),
	.underflow(rx_data_underflow),
	.data_count(rx_data_count)
	/*.dpeek(next_rx_data),
	.push(new_rx_data),
	.pop(pop_rx_data),
	.size(queued_rx_data)*/
);

//wire [7:0] queued_tx_data;
reg [7:0] next_tx_data;
reg enqueue_tx_data;

wire tx_data_valid, tx_data_underflow;

serial_fifo serial_out(
	.clk(clk),
	.rst(rst),
	.din(next_tx_data),
	.wr_en(enqueue_tx_data),
	.rd_en(1'b1),
	.dout(tx_data),
	.full(),
	.empty(),
	.valid(tx_data_valid),
	.underflow(tx_data_underflow),
	.data_count()

	/*.dpeek(tx_data),
	.push(enqueue_tx_data),
	.pop(queued_tx_data > 0),
	.size(queued_tx_data)*/
);

//assign tx_data = next_tx_data;
//assign new_tx_data = queued_tx_data > 0;
assign new_tx_data = tx_data_valid && !tx_data_underflow;

wire IO_Addr_Strobe, IO_Write_Strobe;
wire [31:0] IO_Address, IO_Write_Data;
//wire IO_Ready;

reg [31:0] io_read_data;

reg [15:0] cpu_interrupt_vector;

reg io_ready;

//assign IO_Ready = io_ready;
//assign IO_Read_Data = last_rx_data_q;

always @(posedge clk) begin
	io_ready <= 0;
	//new_tx_data <= 0;
	enqueue_tx_data <= 0;
	pop_rx_data <= 0;
	fb_wea <= 0;
	driver_debug_clk <= 0;
	
	cpu_interrupt_vector <= {14'b0, new_rx_data, 1'b0};
	
	if (has_rx_data) begin
		io_ready <= 1;
		io_read_data <= rx_data_dout;
	end
	
	if (IO_Write_Strobe) begin
		io_ready <= 1;
		if (IO_Address == 32'hD0000000) begin
			// This is the UART
			enqueue_tx_data <= 1;
			next_tx_data <= IO_Write_Data[7:0];
			//new_tx_data <= 1;
			//tx_data <= IO_Write_Data[7:0];
		end else if (IO_Address == 32'hD0000004) begin
			// This is the framebuffer offset
			fb_addr_offset <= IO_Write_Data;
		end else if (IO_Address == 32'hD0000008) begin
			driver_debug_data <= IO_Write_Data[7:0];
			driver_debug_clk <= 1;
		end else if (IO_Address == 32'hD000000C) begin
			driver_debug_en <= IO_Write_Data[0];
		end else if (IO_Address[31:24] == 8'hD1) begin
			// This is the framebuffer
			fb_wea <= 1;
			fb_addra <= IO_Address[12:0];
			fb_dina <= IO_Write_Data[7:0];
		end else begin
			// Exception: We don't know what this address is! But, we can't leave the CPU hanging
		end
	end else if (IO_Read_Strobe) begin
		//io_ready <= 1;
		if (IO_Address == 32'hD0000000) begin
			//io_ready <= 1;
			//io_read_data = rx_data;
			pop_rx_data <= 1;
			//io_read_data <= 8'h12345678;//next_rx_data;
		end else if (IO_Address == 32'hD0000004) begin
			io_ready <= 1;
			io_read_data <= rx_data_count;
		end
	end
end

wire [31:0] gpo1;

assign led = gpo1[7:0];

avr_interface avr_interface (
	.clk(clk),
	.rst(rst),
	.cclk(cclk),
	.spi_miso(spi_miso),
	.spi_mosi(spi_mosi),
	.spi_sck(spi_sck),
	.spi_ss(spi_ss),
	.spi_channel(spi_channel),
	.tx(avr_rx), // FPGA tx goes to AVR rx
	.rx(avr_tx),
	.channel(4'd15), // invalid channel disables the ADC
	.new_sample(),
	.sample(),
	.sample_channel(),
	.tx_data(tx_data),
	.new_tx_data(new_tx_data),
	.tx_busy(tx_busy),
	.tx_block(avr_rx_busy),
	.rx_data(rx_data),
	.new_rx_data(new_rx_data)
);

cpu mcs_0(
  .Clk(clk), // input Clk
  .Reset(rst), // input Reset
  .IO_Addr_Strobe(IO_Addr_Strobe), // output IO_Addr_Strobe
  .IO_Read_Strobe(IO_Read_Strobe), // output IO_Read_Strobe
  .IO_Write_Strobe(IO_Write_Strobe), // output IO_Write_Strobe
  .IO_Address(IO_Address), // output [31 : 0] IO_Address
  .IO_Byte_Enable(), // output [3 : 0] IO_Byte_Enable
  .IO_Write_Data(IO_Write_Data), // output [31 : 0] IO_Write_Data
  .IO_Read_Data(io_read_data), // input [31 : 0] IO_Read_Data
  .IO_Ready(io_ready), // input IO_Ready
  .UART_Rx(0), // input UART_Rx
  .UART_Tx(), // output UART_Tx
  .GPO1(gpo1), // output [31 : 0] GPO1
  .INTC_Interrupt(cpu_interrupt_vector), // input [15 : 0] INTC_Interrupt
  .INTC_IRQ() // output INTC_IRQ
);

endmodule
