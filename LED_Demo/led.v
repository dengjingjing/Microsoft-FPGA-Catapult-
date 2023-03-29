   module led
	(
		input clk,
		output reg[7:0] led_out
	);
	
	parameter One_second = 125000000/2;
	
	reg [31:0] cnt;
	reg second;
	
	
	always@(posedge clk) begin
	
		if(cnt > One_second)
		    begin
				 cnt <= 0;
				 second <=~second;
				 
			 end
	   else
		    cnt <= cnt +1'b1;
			
		
	end
	
	
	always@(posedge second) begin
	
		if(led_out == 8'b000000)
		    led_out <=8'b1000000;
		else
		    led_out <= led_out>>1;
	end
	
	
	
	initial begin
	cnt <= 0;
	second <= 0;
	led_out<=0;
	end
	
	endmodule