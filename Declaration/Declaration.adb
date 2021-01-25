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
		J: Float := 123.2;
		
		begin
			Put_Line(J'Image);
			
		end;
		
end Declaration;
