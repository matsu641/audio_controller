module fill
	(
		CLOCK_50,						//	On Board 50 MHz
		// Your inputs and outputs here
		KEY,							// On Board Keys
		my_3_bit_input,					// Additional 3-bit input
		// The ports below are for the VGA output.  Do not change.
		VGA_CLK,   						//	VGA Clock
		VGA_HS,							//	VGA H_SYNC
		VGA_VS,							//	VGA V_SYNC
		VGA_BLANK_N,						//	VGA BLANK
		VGA_SYNC_N,						//	VGA SYNC
		VGA_R,   						//	VGA Red[9:0]
		VGA_G,	 						//	VGA Green[9:0]
		VGA_B   						//	VGA Blue[9:0]
	);

	input			CLOCK_50;				//	50 MHz
	input	[3:0]	KEY;	
	input	[2:0]	my_3_bit_input;			// 3-bit input
	// Declare your inputs and outputs here
	// Do not change the following outputs
	output			VGA_CLK;   				//	VGA Clock
	output			VGA_HS;					//	VGA H_SYNC
	output			VGA_VS;					//	VGA V_SYNC
	output			VGA_BLANK_N;				//	VGA BLANK
	output			VGA_SYNC_N;				//	VGA SYNC
	output	[7:0]	VGA_R;   				//	VGA Red[7:0] Changed from 10 to 8-bit DAC
	output	[7:0]	VGA_G;	 				//	VGA Green[7:0]
	output	[7:0]	VGA_B;   				//	VGA Blue[7:0]
	
	wire resetn;
	assign resetn = KEY[0];
	
	// Create the colour, x, y, and writeEn wires that are inputs to the controller.
	reg [2:0] colour;
	reg [7:0] x;
	reg [6:0] y;
	reg writeEn;
	
	localparam SCREEN_WIDTH = 160;
	localparam SCREEN_HEIGHT = 120;

	// Create an Instance of a VGA controller - there can be only one!
	// Define the number of colours as well as the initial background
	// image file (.MIF) for the controller.
	vga_adapter VGA(
			.resetn(resetn),
			.clock(CLOCK_50),
			.colour(colour),
			.x(x),
			.y(y),
			.plot(writeEn),
			/* Signals for the DAC to drive the monitor. */
			.VGA_R(VGA_R),
			.VGA_G(VGA_G),
			.VGA_B(VGA_B),
			.VGA_HS(VGA_HS),
			.VGA_VS(VGA_VS),
			.VGA_BLANK(VGA_BLANK_N),
			.VGA_SYNC(VGA_SYNC_N),
			.VGA_CLK(VGA_CLK));
		defparam VGA.RESOLUTION = "160x120";
		defparam VGA.MONOCHROME = "FALSE";
		defparam VGA.BITS_PER_COLOUR_CHANNEL = 1;
		defparam VGA.BACKGROUND_IMAGE = "111.mif"; // Assuming background images are named 000.mif, 001.mif, etc.
			
	// Put your code here. Your code should produce signals x, y, colour, and writeEn
	// for the VGA controller, in addition to any other functionality your design may require.
	
	// Generate signals based on my_3_bit_input with reset functionality
  always @(posedge CLOCK_50 or negedge resetn) begin
    if (~resetn) begin
        // Reset condition, set entire screen to black
        x <= 8'b00000000;
        y <= 7'b0000000;
        colour <= 3'b000;
        writeEn <= 0;
    end else begin
        // Normal operation
        x <= x + 1;

        // If X position reaches the screen width, reset X and increment Y
        if (x == SCREEN_WIDTH) begin
            x <= 8'b00000000;
            y <= y + 1;

            // Reset Y position if it reaches the screen height
            if (y == SCREEN_HEIGHT) begin
                y <= 7'b0000000;
            end
        end

        // Use a case statement for color based on my_3_bit_input
        case (my_3_bit_input)
            3'b000: // If my_3_bit_input is 000
                begin
                    // V green, H red
                    if (x < SCREEN_WIDTH / 2) begin
                        // Left half is green
                        colour <= 3'b010;
                    end else begin
                        // Right half is red
                        colour <= 3'b100;
                    end
                end
            // Add more cases as needed for other values of my_3_bit_input
					 3'b001: // If my_3_bit_input is 001
                begin
                    // V yellow, H red
                    if (x < SCREEN_WIDTH / 2) begin
                        // Left half is yellow
                        colour <= 3'b110;
                    end else begin
                        // Right half is red
                        colour <= 3'b100;
                    end
                end
					 3'b010: // If my_3_bit_input is 010
                begin
                    // V red, H green
                    if (x < SCREEN_WIDTH / 2) begin
                        // Left half is red
                        colour <= 3'b100;
                    end else begin
                        // Right half is green
                        colour <= 3'b010;
                    end
                end
					 3'b011: // If my_3_bit_input is 011
                begin
                    // V red, H yellow
                    if (x < SCREEN_WIDTH / 2) begin
                        // Left half is red
                        colour <= 3'b100;
                    end else begin
                        // Right half is yellow
                        colour <= 3'b110;
                    end
                end
					 3'b100: // If my_3_bit_input is 100
                begin
                    // All R, V next
                    if (x < SCREEN_WIDTH / 2) begin
                        // Left half is red
                        colour <= 3'b100;
                    end else begin
                        // Right half is red
                        colour <= 3'b100;
                    end
                end
					 3'b101: // If my_3_bit_input is 101
                begin
                    // All R, H next
                    if (x < SCREEN_WIDTH / 2) begin
                        // Left half is red
                        colour <= 3'b100;
                    end else begin
                        // Right half is red
                        colour <= 3'b100;
                    end
                end

            default: // Default case, if my_3_bit_input doesn't match any of the above
                colour <= 3'b000; // Black
        endcase

        // Enable writing to the VGA memory
        writeEn <= 1;
    end
end
	
endmodule
