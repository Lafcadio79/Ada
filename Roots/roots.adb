-- -----------------------------------------------------------
-- |                                                          |
-- |         A procedure that asks you for a number           |
-- |             and computes its square root                 | 
-- |          (DATA_ERROR exception to be handled)            |
-- |                                                          | 
-- -----------------------------------------------------------

with Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Elementary_Functions;
with ADA.IO_EXCEPTIONS;

procedure Roots is
	-- all the 'use' declarations can also be put upper, immediately after the 'with' clauses
	use Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Elementary_Functions;
	X: Float;
	begin
		Put("Roots of various numbers");
		New_Line;
		Put("[type 0 to exit]");
		New_Line(2);		
		loop
			Put("> ");
			Get(X); -- asks for an input
			exit when X = 0.0; -- loop guard
			Put(" Root of "); Put(X); Put(" is ");
			if X < 0.0 then
				Put("not calculable");
			else
				Put(Sqrt(X));
			end if;
			New_Line;
		end loop;
		New_Line;
		Put("Program finished!");
		New_Line;
		
end Roots;
