-- -----------------------------------------------------------
-- |                                                          |
-- |        A procedure that prints a 10 x 10 matrix          |
-- |     The way to revise the base multiplication table :)   | 
-- |                                                          | 
-- -----------------------------------------------------------

with Ada.Text_IO, Ada.Integer_Text_IO;

procedure Pitagora is
	use Ada.Integer_Text_IO, Ada.Text_IO;
begin
   -- example of nested loops
   New_Line;
   for Row in 1 .. 10 loop
      for Column in 1 .. 10 loop
         Put(Row * Column, 5);
      end loop;
      New_Line;
   end loop;
   
end Pitagora;
