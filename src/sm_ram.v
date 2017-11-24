// Quartus Prime Verilog Template
// True Dual Port RAM with dual clocks

module sm_ram
#(parameter DATA_WIDTH=32,
  parameter ADDR_WIDTH=4,
  parameter DEBUG=1
)
(
	input [(DATA_WIDTH-1):0] data_a, data_b,
	input [(ADDR_WIDTH-1):0] addr_a, addr_b,
	input we_a, we_b, clk_a, clk_b,
	output [(DATA_WIDTH-1):0] q_a, q_b
);
	// Declare the RAM variable
	reg [DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];

	initial begin
		$readmemh("memory.hex", ram);
	end

	assign q_a = ram[addr_a];
	assign q_b = ram[addr_b];

	always @ (posedge clk_a)
	begin
		if (we_a)
		begin
			if (DEBUG)
				$write("\n--RAM--: write_a addr_a %d %d\n", data_a, addr_a);
			ram[addr_a] <= data_a;
		end
	end

	always @ (posedge clk_b)
	begin
		if (we_b)
		begin
			if (DEBUG)
				$write("\n--RAM--: write_b addr_b %d %d\n", data_b, addr_b);
			ram[addr_b] <= data_b;
		end
	end

/*
	always @ (posedge clk_a)
	begin
		// $write("\n--RAM--: data_a = %d, addr_a = %d, we_a = %d\n", data_a, addr_a, we_a);
		// Port A 
		if (we_a) 
		begin
			ram[addr_a] <= data_a;
			q_a <= data_a;
		end
		else 
		begin
			q_a <= ram[addr_a];
		end 
	end


	always @ (posedge clk_b)
	begin
		// Port B 
		if (we_b) 
		begin
			ram[addr_b] <= data_b;
			q_b <= data_b;
		end
		else 
		begin
			q_b <= ram[addr_b];
		end 
	end
*/

endmodule
