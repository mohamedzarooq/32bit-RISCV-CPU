module program_counter(
    input logic clk, 
    input logic reset, 
    input logic redir,  
    input logic [31:0] redir_addr, 
    input logic count_en, 
    output logic [31:0] pc_out
);

      logic [31:0] next_pc;

      assign next_pc = pc_out + 32'd4;
        
    
      always @(posedge clk) begin
            if (reset)
                pc_out <= 0;
            else if(redir)
                pc_out <= redir_addr;
            else if (count_en)
                pc_out <= next_pc;
        end
        
    
    endmodule
