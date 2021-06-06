-- -----------------------------------------------------------
-- |                                                          |
-- |               Object Oriented Programming                |
-- |		         (Type extension)                     |
-- |                                                          |
-- -----------------------------------------------------------


-- This example is a more precise definition of the class Clerks through a root class Humans
-- which take advantage


-- Furthermore, the notion of class wide type is strictly related to the concept of polimorphism
-- a paradigm that will be dealt with later on


with Ada.Text_IO;

package body Utility is
	use Ada.Text_IO;

	function Get_String return String is
		Line : String (1 .. 1_000);
		Last : Natural;
	begin
	
		Get_Line (Line, Last);
		
		return Line (1 .. Last);
	
	end Get_String;
 
	function Get_Integer return Integer is
		S : constant String := Get_String;
	begin
  
		--  may raise exception Constraint_Error if value entered is not a well-formed integer
		return Integer'Value (S);
	
	end Get_Integer;

	function Get_Character return Character is
		S : String := Get_String;
	begin

		return S(1);
		
	end Get_Character;
	



end Utility; 
