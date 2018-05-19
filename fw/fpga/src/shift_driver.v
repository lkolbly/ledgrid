`timescale 1ns / 1ps

module shift_driver(
	input clk,
	input rst,
	
	output [15:0] fb_addr,
	input [7:0] fb_data,
	
	input [7:0] debug_data_in,
	input debug_clk_in,
	input debug_en,
	
	output oe,
	output rclk,
	output srclk,
	output srclr,
	output reg [35:0] ser
);

reg [36*8-1:0] debug_data, scratch_debug_data;
wire [36*8-1:0] next_debug_data = {debug_data_in, debug_data[36*8-1:8]};

reg [15:0] query_addr;

assign fb_addr = query_addr + (
	col_data[0] ? 0 :
	col_data[1] ? 216 :
	col_data[2] ? 216*2 :
	col_data[3] ? 216*3 :
	col_data[4] ? 216*4 :
	col_data[5] ? 216*5 :
	col_data[6] ? 216*6 :
	216*7
);

reg [15:0] delay_ctr;

// When data_load_bits_left is >0, we load data from the framebuffer into data.
reg [35:0] data;
reg [5:0] data_load_bits_left;
reg load_should_register;

reg [2:0] bits_left;
reg [7:0] col_data;

reg [7:0] cnt;

`define STATE_IDLE 0
`define STATE_HOLDING 1
`define STATE_CLOCK_HIGH 2
`define STATE_SRCLK_HIGH 3
`define STATE_FINISH 4

reg [3:0] state;

assign oe = 1;
assign srclk = state == `STATE_SRCLK_HIGH;
assign rclk = state == `STATE_FINISH;
assign srclr = rst;

wire [12:0] next_fb_addr;

address_map am(
	.addr(query_addr),
	.next_addr(next_fb_addr)
);

reg [12:0] last_fb_addr;

wire next_data_bit =
	(last_fb_addr[11] == 1 && last_fb_addr[2:0] == 0) ? col_data[0] : // This is a column
	(last_fb_addr[11] == 1 && last_fb_addr[2:0] == 1) ? col_data[1] :
	(last_fb_addr[11] == 1 && last_fb_addr[2:0] == 2) ? col_data[2] :
	(last_fb_addr[11] == 1 && last_fb_addr[2:0] == 3) ? col_data[3] :
	(last_fb_addr[11] == 1 && last_fb_addr[2:0] == 4) ? col_data[4] :
	(last_fb_addr[11] == 1 && last_fb_addr[2:0] == 5) ? col_data[5] :
	(last_fb_addr[11] == 1 && last_fb_addr[2:0] == 6) ? col_data[6] :
	(last_fb_addr[11] == 1 && last_fb_addr[2:0] == 7) ? col_data[7] :
	(fb_data > cnt);

always @(posedge clk) begin
	last_fb_addr <= query_addr;
	
	if (debug_clk_in) begin
		debug_data <= next_debug_data;
	end

	if (data_load_bits_left > 0) begin
		data <= debug_en ? scratch_debug_data[35:0] : {data, next_data_bit};
		data_load_bits_left <= data_load_bits_left - 1;
		
		if (data_load_bits_left == 1) begin
			//ser <= {data, next_data_bit};
			load_should_register <= 1;
		end else begin
			query_addr <= next_fb_addr;
		end
	end
	if (load_should_register) begin
		load_should_register <= 0;
		ser <= {data, next_data_bit};
	end

	if (rst) begin
		state <= `STATE_IDLE;
		col_data <= 8'b00000010;
		delay_ctr <= 0;
		cnt <= 0;
		load_should_register <= 0;
	end else if (delay_ctr > 0) begin
		delay_ctr <= delay_ctr - 1;
	end else begin
		//if (state != `STATE_IDLE) begin
			// Slow down from 100MHz
			// The idle state is just book keeping, so it can be fast
		delay_ctr <= 32; // NOTE: 32 is known to work on the test breadboard
		//delay_ctr <= 15000;
		//end
		case (state)
		`STATE_IDLE: begin
			state <= `STATE_HOLDING;
			bits_left <= 7;
			cnt <= cnt + 1;
			if (cnt == 255) begin
				if (col_data[7]) begin
					col_data <= 8'b01000000;
				end else if (col_data[6]) begin
					col_data <= 8'b00100000;
				end else if (col_data[5]) begin
					col_data <= 8'b00010000;
				end else if (col_data[4]) begin
					col_data <= 8'b00001000;
				end else if (col_data[3]) begin
					col_data <= 8'b00000100;
				end else if (col_data[2]) begin
					col_data <= 8'b00000010;
				end else if (col_data[1]) begin
					col_data <= 8'b00000001;
				end else if (col_data[0]) begin
					col_data <= 8'b10000000;
				end else begin
					col_data <= 8'b10000000;//{col_data[0], col_data[7:1]};
				end
			end

			// @TODO: Reset to reset value for this column
			query_addr <= 4095; // 4095 is the reset value
			scratch_debug_data <= debug_data;
			
			// Load the first rows of data...
			data_load_bits_left <= 37;
		end
		`STATE_HOLDING: begin
			state <= `STATE_CLOCK_HIGH;
		end
		`STATE_CLOCK_HIGH: begin
			state <= `STATE_SRCLK_HIGH;
		end
		`STATE_SRCLK_HIGH: begin
			//data_load_bits_left <= 37;
			scratch_debug_data <= {36'h0, scratch_debug_data[36*8-1:36]};
			if (bits_left == 0) begin
				state <= `STATE_FINISH;
			end else begin
				bits_left <= bits_left - 1;
				state <= `STATE_HOLDING;

				// Start loading the next data...
				data_load_bits_left <= 37;
			end
		end
		`STATE_FINISH: begin
			state <= `STATE_IDLE;

			// Load the first rows of data...
			//fb_addr <= 4095; // 4095 is the reset value
			//data_load_bits_left <= 37;
		end
		endcase
	end
end

endmodule
