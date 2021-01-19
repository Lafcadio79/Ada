-- -----------------------------------------------------------
-- |                                                          |
-- | A procedure that asks you for a name, create a txt file  |
-- |            and writes on it a welcome message            |
-- |                                                          | 
-- -----------------------------------------------------------

with Ada.Text_IO;

procedure Write is
   use Ada.Text_IO;
   Str: String(1 .. 80);
   Last: Integer;
   F: File_Type;
begin
   Put("What is your name? ");
   Get_Line(Str, Last);
   Create(F, Out_File, "writeline.txt");
   Put_Line(F, "Hello " & Str(1 .. Last) & ", welcome in Ada!");
   Close(F);
   
end Write;
