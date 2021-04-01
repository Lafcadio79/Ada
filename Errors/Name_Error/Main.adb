-- -----------------------------------------------------------
-- |                                                          |
-- |                   Handling exception                     |
-- |                                                          |
-- -----------------------------------------------------------

with Ada.Text_IO;
with Ada.Exceptions;

procedure Main is
	use Ada.Text_IO;
	use Ada.Exceptions;
	
	In_File: File_Type;
	
begin
	
	-- try to open a file that doesn't exist
	Open(File => In_File, Mode => Ada.Text_IO.In_File,  Name => "input.txt");
	
	-- excption handling
	exception
		when E : Name_Error =>
			Put("Cannot open input file : ");
			Put_Line(Exception_Message(E));
			raise;

end Main;
