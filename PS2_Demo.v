
module PS2_Demo (
	// Inputs
	CLOCK_50,
	KEY,

	// Bidirectionals
	PS2_CLK,
	PS2_DAT,
	
	// Outputs
	output_3bits
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/


/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/

// Inputs
input				CLOCK_50;
input		[3:0]	KEY;

// Bidirectionals
inout				PS2_CLK;
inout				PS2_DAT;

// Outputs
output reg [2:0] output_3bits;


/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/

// Internal Wires
wire		[7:0]	ps2_key_data;
wire				ps2_key_pressed;

// Internal Registers
reg			[7:0]	last_data_received;

// State Machine Registers

/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/


/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/

always @(posedge CLOCK_50) begin
    if (KEY[0] == 1'b0)
        last_data_received <= 8'h00;
	 
    else if (ps2_key_pressed == 1'b1)
        last_data_received <= ps2_key_data;
	 else if(last_data_received != 8'h00) last_data_received <= 8'h00;
		  
		
	 //else last_data_received <= 8'h00;
		  
	//if(ps2_key_pressed == 1'b1) begin
    // Add your logic to map specific keys to a 3-bit output
    case (last_data_received)
        // Define cases for specific keys and update output_3bits accordingly
        // For example:
		  
				8'h34: output_3bits <= 3'b000; // Map key g (Green V) to 3-bit value 000
				8'h35: output_3bits <= 3'b001; // Map key y (Yellow V) to 3-bit value 001
				8'h2D: output_3bits <= 3'b010; // Map key r (Red V) to 3-bit value 010
				8'h1D: output_3bits <= 3'b011; // Map key w (Wait V) to 3-bit value 011
				8'h2A: output_3bits <= 3'b100; // Map key v (V Next) to 3-bit value 100
				8'h33: output_3bits <= 3'b101; // Map key h (H Next) to 3-bit value 101
        // ...
				default: output_3bits <= 3'b111; // Default case, all bits set to 1
    endcase
	//end
	//else if(ps2_key_pressed == 1'b0)
	//	output_3bits <= 3'b111;
end


/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/


/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/

PS2_Controller PS2 (
	// Inputs
	.CLOCK_50				(CLOCK_50),
	.reset				(~KEY[0]),

	// Bidirectionals
	.PS2_CLK			(PS2_CLK),
 	.PS2_DAT			(PS2_DAT),

	// Outputs
	.received_data		(ps2_key_data),
	.received_data_en	(ps2_key_pressed)
);



endmodule
