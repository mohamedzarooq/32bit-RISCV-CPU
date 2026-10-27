module pc_branch(
    input logic signed [31:0] rs1,
    input logic signed [31:0] rs2,
    input logic [2:0]funct3,
    output logic branch_taken
);

    logic [31:0] unsigned_rs1;
    assign unsigned_rs1 = rs1;
    logic [31:0] unsigned_rs2; 
    assign unsigned_rs2 = rs2;

    always_comb begin
        case(funct3) 
            3'd0 : //BEQ
                branch_taken = (rs1 == rs2);
                
            3'd1 : //BNE
                branch_taken = (rs1 != rs2);

            3'd4 : //BLT
                branch_taken = (rs1 < rs2);
            
            3'd5 : //BGE
                branch_taken = (rs1 >= rs2);
            
            3'd6 : //BLTU
                branch_taken = (unsigned_rs1 < unsigned_rs2);

            3'd7 : //BGEU
                branch_taken = (unsigned_rs1 >= unsigned_rs2);
            
            default : branch_taken = '0;
        endcase
    end



endmodule