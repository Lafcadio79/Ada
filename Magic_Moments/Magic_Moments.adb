-- -----------------------------------------------------------
-- |                                                          |
-- |                      Magic Moments                       |
-- |                      by John Barnes                      |
-- |                   (Example of Ada 2012)                  |
-- -----------------------------------------------------------


with Build_List;
with Tabulate_Properties;
with Geometry.Lists;
with Ada.Text_IO;
with Ada.Float_Text_IO;

procedure Magic_Moments is
  use Geometry.Lists;
  use Ada.Text_IO;
  use Ada.Float_Text_IO;

  The_List: List := null;
begin

  Put("Welcome to Magic Moments");
  New_Line(2);
  Put("Enter C, T or S followed by coords and dimensions");
  New_Line;
  Put("Terminate list with any other letter");
  New_Line(2);
  Build_List(The_List);
  Tabulate_Properties(The_List);
  New_Line(2);
  Put("Finished");
  New_Line;
  Skip_Line(2);

end Magic_Moments;
