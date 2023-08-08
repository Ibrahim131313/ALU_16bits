module Alu1(Inp1, Inp2, Op_code, Result);
  input signed [15:0] Inp1, Inp2;
  input signed [2:0] Op_code;
  output reg signed[31:0] Result;
  
    always @(Inp1, Inp2, Op_code)
    begin
    
   if (Op_code == 3'b000)
     Result = Inp1 + Inp2;
     
    else if (Op_code == 3'b001)
     Result = Inp1 - Inp2;
     
    else if (Op_code == 3'b010)
     Result = Inp1 * Inp2;
     
     else if (Op_code == 3'b011)
     Result = Inp1 / Inp2;
     
     else if (Op_code == 3'b100)
     Result = Inp1 | Inp2;
     
     else if (Op_code == 3'b101)
     Result = Inp1 & Inp2;
     
     else if (Op_code == 3'b110)
     Result = ~Inp1;
     
     else if (Op_code == 3'b111)
     Result = ~Inp2;
     
   else 
      Result = 0;
      
 end    
 endmodule
   
