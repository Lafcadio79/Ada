-- -----------------------------------------------------------
-- |                                                          |
-- |    How to use a declaration block within a procedure     |
-- |                                                          |
-- -----------------------------------------------------------


with Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO; 

procedure Declaration is
	use Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO;
	
	A : Integer := 16#FfF#;

begin
	Put_line(A'Image);
	
	declare
		J: Float := 0.0;          -- declaration here
		
		begin
			j := 123.2;       -- statement here
			Put_Line(J'Image);
			
		end;
		
end Declaration;
