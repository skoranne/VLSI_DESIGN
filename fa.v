/*
 * fa.v
 */
//`timescale 1ns/1ps
module fa(a,b,cin,s,cout);
input a,b,cin;
output s,cout;
	assign	s = a ^ b ^ cin;
	assign cout = a & b | (a^b) & cin;
endmodule

module test();
reg a,b,cin;
wire s,cout;

fa U1(.a(a),.b(b),.cin(cin),.s(s),.cout(cout));
	initial begin
	$monitor("Time %t",$time);
	end
	always @(a or b or cin) begin
	//$display("At TIME %t A=%b, B=%b, c_in=%b SUM=%b c_out=%b\n",$time,a,b,cin,s,cout);
	$display($time," ",a,b," ",cin," s ",s,cout);
	end
//		always #5 a = ~a;
//		always #10 b = ~b;
initial begin
	#5  cin=1;
	#10 a=1;
	#10 b=1;
	#10 a=0;
	#10 a=1;
	#100 $finish;

end

endmodule

