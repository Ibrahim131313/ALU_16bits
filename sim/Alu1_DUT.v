  module Alu1_DUT();
    reg signed [15:0]Inp1, Inp2;
    reg signed [2:0]Op_code;
    wire signed [31:0] Result;
    
    initial begin
    //Addition 
      
      // 0000 0000 0000 0101 + 0000 0000 0000 0011 = 0000 0000 0000 1000 (5+3=8)  this is how to work
      
       Op_code = 000; 
       Inp1 = 5;   
       Inp2 = 3;
       #50
       //--------------------------------
       Inp1 = 200;   
       Inp2 = ~16'b0000_1100_0000_1010; 
       #100;
       //--------------------------------
       Inp1 = 200;   
       Inp2 = ~567;
       #150;
       
       
     //Substraction 
       
       Op_code = 001;
        Inp1 = 111;
        Inp2 = ~16'b111;
        #100;
         //--------------------------------
        Inp1 = 566;
        Inp2 = ~436;
        #150;
        
        //Multiplication 
       
       Op_code = 010;
        Inp1 = 321;
         Inp2 = 56;
          #100;
        //-------------------------------
          Inp1 = 200;
         Inp2 = ~16'b0000_1100_0000_1010;
          #150;
          
        //Division
           
       Op_code = 011; Inp1 = ~240; Inp2 = 80; #100;
         
         //logical OR 
       
       Op_code = 100; Inp1 = 16'b0000_0000_0000_1111; Inp2 = 16'b0000_1100_0000_1010; #100;
        
        
         //logical And 
         
       Op_code = 101; Inp1 = 16'b0000_0000_0010_1001; Inp2 = 16'b0000_1100_0000_1010; #100;
         
        
        //Invertor1   
         
       Op_code = 110; Inp1 = 16'b0000_1100_0111_1010; #100;
          
          //Invertor2 
          
       Op_code = 111; Inp2 = ~16'b0000_1100_0000_1010; #100;
    end
    
   Alu1 P1(Inp1, Inp2, Op_code, Result);
   
   always @(Inp1, Inp2, Op_code)
   begin
   
       if  (Op_code == 3'b000)
      $monitor("%b + %b = %b \t %d + %d = %d", Inp1, Inp2, Result, Inp1, Inp2, Result);
      
      else if (Op_code == 3'b001)
         $monitor("%b - %b = %b \t %d - %d = %d", Inp1, Inp2, Result, Inp1, Inp2, Result);
         
    else if (Op_code == 3'b010)
         $monitor("%b * %b = %b \t %d * %d = %d", Inp1, Inp2, Result, Inp1, Inp2, Result);
     
     else if (Op_code == 3'b011)
         $monitor("%b / %b = %b \t %d / %d = %d", Inp1, Inp2, Result, Inp1, Inp2, Result);
         
          else if (Op_code == 3'b100)
         $monitor("%b | %b = %b", Inp1, Inp2, Result, Inp1, Inp2, Result);
         
         else if (Op_code == 3'b101)
         $monitor("%b & %b = %b", Inp1, Inp2, Result, Inp1, Inp2, Result);
         
          else if (Op_code == 3'b110)
         $monitor("%~b = %b", Inp1,  Result, Inp1,  Result);
         
       else Result = 0
         
    end
    
endmodule  


 
