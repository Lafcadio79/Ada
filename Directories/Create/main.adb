-- -----------------------------------------------------------
-- |                                                          |
-- |                   Predefined library                     |
-- |                                                          |
-- -----------------------------------------------------------


with Ada.Text_IO;
with Ada.Directories;

procedure Main is
	use Ada.Text_IO;
	use Ada.Directories;
	
begin
	-- create the directory Here in C:\ 
	Create_Directory("\Here");
	
end Main;
