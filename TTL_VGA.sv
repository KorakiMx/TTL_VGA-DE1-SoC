module TTL_VGA (CLOCK_50, GPIO_0, VGA_HS, VGA_VS, VGA_R, VGA_G, 
					VGA_B, VGA_BLANK_N, VGA_SYNC_N, VGA_CLK);
					
	input CLOCK_50;
	input [35:0]GPIO_0;
	output VGA_HS;
	output VGA_VS;
	output [7:0]VGA_R;
	output [7:0]VGA_G;
	output [7:0]VGA_B;
	output VGA_BLANK_N;
	output VGA_SYNC_N;
	output VGA_CLK;
	
	logic reset;
	logic [9:0] x;
	logic [8:0] y;
	logic [7:0] r, g, b, R, G, B;
	logic PixelClock;
	logic HS,VS;
	
//Asignación de los GPIO_0 a los colores
	assign VGA_R[0]=GPIO_0[31];
	assign VGA_R[1]=GPIO_0[30];
	assign VGA_R[2]=GPIO_0[29];
	assign VGA_R[3]=GPIO_0[28];
	assign VGA_R[4]=GPIO_0[27];
	assign VGA_R[5]=GPIO_0[26];
	assign VGA_R[6]=GPIO_0[25];
	assign VGA_R[7]=GPIO_0[24];
	
	assign VGA_G[0]=GPIO_0[23];
	assign VGA_G[1]=GPIO_0[22];
	assign VGA_G[2]=GPIO_0[21];
	assign VGA_G[3]=GPIO_0[20];
	assign VGA_G[4]=GPIO_0[19];
	assign VGA_G[5]=GPIO_0[18];
	assign VGA_G[6]=GPIO_0[17];
	assign VGA_G[7]=GPIO_0[16];
	
	assign VGA_B[0]=GPIO_0[15];
	assign VGA_B[1]=GPIO_0[14];
	assign VGA_B[2]=GPIO_0[13];
	assign VGA_B[3]=GPIO_0[12];
	assign VGA_B[4]=GPIO_0[11];
	assign VGA_B[5]=GPIO_0[10];
	assign VGA_B[6]=GPIO_0[9];
	assign VGA_B[7]=GPIO_0[8];
	
	
//Asignar la sincronización vertical y horizontal de la tarjeta adafruit
   assign VGA_HS = GPIO_0[4];
	assign VGA_VS = GPIO_0[3];
	
	assign PixelClock = GPIO_0[6];
	
// Instancia del driver de video
	video_driver #(.WIDTH(640), .HEIGHT(480))
		v1 (.PixelClock, .reset, .x, .y, .r, .g, .b,
			 .R, .G, .B, .VGA_BLANK_N,
			 .VGA_CLK, .HS, .VGA_SYNC_N, .VS);
	
endmodule  