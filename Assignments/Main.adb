-- -----------------------------------------------------------
-- |                                                          |
-- |                        Execute                           |
-- |                                                          |
-- -----------------------------------------------------------

with Assignments; use Assignments;
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
	My: Colour;
	begin
	My := Print_Colour(Red);
	
	Put(My'Image);
	
end Main;
