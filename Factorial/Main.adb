-- -----------------------------------------------------------
-- |                                                          |
-- |                        Execute                           |
-- |                                                          |
-- -----------------------------------------------------------

with math;
with Ada.Text_IO;

procedure Main is
	use math;
	use Ada.Text_IO;
	
	I, R : Positive;
	
	begin

	Put("Insert a value: ");

	I := Positive'Value(Get_Line);

	R := Factorial(I);
	
	Put("The factorial of " & I'Image & " is " & R'Image);
	
end Main;
