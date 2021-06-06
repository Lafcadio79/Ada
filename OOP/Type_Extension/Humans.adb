-- -----------------------------------------------------------
-- |                                                          |
-- |               Object Oriented Programming                |
-- |			 (Type extension)                     |
-- |                                                          |
-- -----------------------------------------------------------


-- This example is a more precise definition of the class Clerks through a root class Humans
-- which take advantage


-- Furthermore, the notion of class wide type is strictly related to the concept of polimorphism
-- a paradigm that will be dealt with later on

with Ada.Text_IO;

package body Humans is
	use Ada.Text_IO;
	
	function CurrentAge(H: Human) return Sub_Int is
	
	begin
		
		return H.Age;
		
	end CurrentAge;

end Humans;
