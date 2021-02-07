-- -----------------------------------------------------------
-- |                                                          |
-- |                     A simple calculator                  |
-- |                                                          |
-- -----------------------------------------------------------


-- a calculator that iteratively returns a menu made up of 5 mathematical operations,
-- that is: sum, sub, mul, div, and pow.

-- note that not all the exceptions that can be raised have been managed

with Calculator;
with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.IO_Exceptions;

procedure Main is
	use Calculator;
	use Ada.Text_IO;
	use Ada.Integer_Text_IO;
	use Ada.IO_Exceptions;

	a : Integer := 1;
	b : Integer := 1;
	c : Character := 'y';
	v : Integer := 0;
	

begin
	-- while statement (when we want to test a condition at the beginning of each iteration)
	-- in this case, a character from the standard input
	
	while c = 'y' loop
			
			-- iterative menu
			Put_Line("1 - sum");
			Put_Line("2 - sub");
			Put_Line("3 - mul");
			Put_Line("4 - div");
			Put_Line("5 - pow");
			Put_Line("Choice: "); Get(v);
			Put("gimme two integers: ");
			Get(a);
			Get(b);
					
			case v is
				when 1 => Put_Line("Result: " & sum(a,b)'Image);
				when 2 => Put_Line("Result: " & sub(a,b)'Image);
				when 3 => Put_Line("Result: " & mul(a,b)'Image);
				when 4 => Put_Line("Result: " & div(a,b)'Image);
				when 5 => Put_Line("Result: " & pow(a,b)'Image);
				when others => Put_Line("None of the above"); -- default statement
			end case;
			Put_Line("Continue?[y/n]");
			Get(c);
			
		end loop;

		exception
				when Ada.IO_Exceptions.Data_Error =>
					Put_Line ("The next time try a number from 1 to 5");

		Put_Line("Program terminated!");
	
end Main;
