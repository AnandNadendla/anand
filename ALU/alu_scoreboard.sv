class alu_scoreboard extends uvm_scoreboard;
`uvm_component_utils(alu_scoreboard)

uvm_analysis_imp #(alu_seq_item, alu_scoreboard) analysis_export;

function new(string name = "alu_scoreboard", uvm_component parent = null);
	super.new(name, parent);
endfunction

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	analysis_export = new("analysis_export", this);
endfunction

function void write(alu_seq_item item);
	bit [7:0] expected_result;
	bit expected_cout;
	bit [8:0] arithmetic_result;

	expected_result = '0;
	expected_cout = 1'b0;

	case (item.opcode)
		3'b001: begin
			arithmetic_result = item.a + item.b;
			expected_result = arithmetic_result[7:0];
			expected_cout = arithmetic_result[8];
		end
		3'b010: begin
			expected_result = item.a - item.b;
			expected_cout = (item.a < item.b);
		end
		3'b011: expected_result = item.a & item.b;
		3'b100: expected_result = item.a ^ item.b;
		3'b101: expected_result = item.a * item.b;
		3'b110: begin
			if (item.b != 0)
				expected_result = item.a % item.b;
		end
		3'b111: expected_result = ~(item.a & item.b);
		default: begin
			arithmetic_result = item.a + item.b;
			expected_result = arithmetic_result[7:0];
			expected_cout = arithmetic_result[8];
		end
	endcase

	if ((item.result === expected_result) && (item.cout === expected_cout)) begin
		`uvm_info("SCOREBOARD", $sformatf(
			"PASS: a=%0d b=%0d opcode=%0d result=%0d cout=%0d",
			item.a, item.b, item.opcode, item.result, item.cout), UVM_MEDIUM)
	end else begin
		`uvm_error("SCOREBOARD", $sformatf(
			"FAIL: a=%0d b=%0d opcode=%0d expected result=%0d cout=%0d, got result=%0d cout=%0d",
			item.a, item.b, item.opcode, expected_result, expected_cout,
			item.result, item.cout))
	end
endfunction
endclass