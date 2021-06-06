-- -----------------------------------------------------------
-- |                                                          |
-- |               Object Oriented Programming                |
-- |					           (Type extension)				         		  |
-- |            											                        |
-- -----------------------------------------------------------


-- This example is a more precise definition of the class Clerks through a root class Humans
-- which take advantage


-- Furthermore, the notion of class wide type is strictly related to the concept of polimorphism
-- a paradigm that will be dealt with later on

with Humans;
with Clerks;
with Ada.Text_IO;


procedure Main is
	use Humans;
	use Clerks;	
	use Ada.Text_IO;

	C: Clerk;
	
begin

	C := Get_New_Clerk;
	
	Print_Clerk(C);

end Main;
