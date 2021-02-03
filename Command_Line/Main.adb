with Ada.Strings;
with Ada.Text_IO;
with Ada.Command_Line;


procedure Main is
	use Ada.Strings;
	use Ada.Text_IO;
	use Ada.Command_Line;
	
	type String_Ref is access String;
	Null_String: constant String_Ref := new String'("");
	
    My_String : String_ref;
begin

	if Ada.Command_Line.Argument_Count = 0  then
		Put_Line (" Usage:   Main   string");
		return;
	end if;
	
	My_String := new String'(Ada.Command_Line.Argument(1));
	
	Put_Line("Did you really write " & My_String.all & "?");

end Main;
