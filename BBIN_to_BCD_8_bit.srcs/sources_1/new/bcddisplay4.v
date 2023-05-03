module bcddisplay4(input clk, input [7:0] sw,
output [3:0] an,
output [6:0] seg);
parameter zero = 4'b0000;
wire clk_out;
wire [3:0] mux_out;
wire [1:0] counter_out;
wire [3:0] ones, tens, hundreds;
binary_to_BCD u0(sw, ones, tens, hundreds);
mux4to1 u1(ones, tens, hundreds, zero, counter_out, mux_out);
slowclock u2(clk, clk_out);
my_counter u3(clk_out, counter_out);
decoder2to4 u4(counter_out, an);
bcd7seg u5(mux_out, seg);
endmodule