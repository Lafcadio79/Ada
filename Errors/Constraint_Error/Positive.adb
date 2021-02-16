-- -----------------------------------------------------------
-- |                                                          |
-- |                          Errors                          |
-- |                                                          |
-- -----------------------------------------------------------


-- if you try to insert a negative value the constraint error will be raised (and managed) 

with Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure P is
	use Ada.Text_IO;
	use Ada.Integer_Text_IO;
	
	V: Positive;
begin
	Put("Give me a value: ");
	
  Get(V);
	
  Put_Line("Value assigned: " & V'Image);
  
	exception
		when CONSTRAINT_ERROR =>
			Put_Line("CONSTRAINT_ERROR managed");
			Put_Line("Value assigned: " & V'Image);
		when others =>
			Put_Line("unknown error");
	
end P;
