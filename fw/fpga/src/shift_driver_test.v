`timescale 1ns / 1ps

module shift_driver_test;

	// Inputs
	reg clk;
	reg rst;
	wire [7:0] data;
	
	reg fb_wea;
	reg [15:0] fb_addra;
	reg [7:0] fb_dina;

	// Outputs
	wire [15:0] addr;
	wire oe;
	wire rclk;
	wire srclk;
	wire srclr;
	wire [35:0] ser;

	// Instantiate the Unit Under Test (UUT)
	shift_driver uut (
		.clk(clk), 
		.rst(rst), 
		.fb_addr(addr),
		.fb_data(data),
		.debug_data_in(0),
		.debug_clk_in(0),
		.debug_en(0),
		.oe(oe), 
		.rclk(rclk), 
		.srclk(srclk), 
		.srclr(srclr), 
		.ser(ser)
	);

	fb_ram_8x5184 fbram(
		.clka(clk),
		.wea(fb_wea),
		.addra(fb_addra),
		.dina(fb_dina),
		.douta(),
		
		.clkb(clk),
		.web(1'b0),
		.addrb(addr),
		.dinb(8'b0),
		.doutb(data)
	);

	`define CLK begin clk = !clk; #5; clk = !clk; #5; end
	
	reg [15:0] i;

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		//data = 8'h55;
		
		// Setup the framebuffer
		`CLK;
		for (i=0; i<24*24*3; i=i+1) begin
			fb_wea = 1;
			fb_addra = i;
			fb_dina = i[7:0];
			`CLK;
		end

		// Wait 100 ns for global reset to finish
		`CLK; `CLK;

		// Add stimulus here
		rst = 0;
		forever begin
			`CLK;
		end

	end
      
endmodule

