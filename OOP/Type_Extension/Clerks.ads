-- -----------------------------------------------------------
-- |                                                          |
-- |               Object Oriented Programming                |
-- |			         (Type extension)                     |
-- |                                                          |
-- -----------------------------------------------------------


-- This example is a more precise definition of the class Clerks through a root class Humans
-- which take advantage


-- Furthermore, the notion of class wide type is strictly related to the concept of polimorphism
-- a paradigm that will be dealt with later on

with Humans;
with Ada.Text_IO;

package Clerks is
	use Humans;
	use Ada.Text_IO;
	
	subtype Workday is Weekdays range Mon .. Fri;
	
	type Workday_Table is array (Positive range <>) of Workday;
	
	-- as structured so far, the clerk works just one day (you need to define an array of Workday)
	type Clerk is new Human with
		record
			ID		: Integer;
			WDays	: Workday;
		end record;
		
	function Get_ID(C: Clerk) return Integer;

	procedure Print_Clerk(C: Clerk);

	function Get_New_Clerk return Clerk;
	
end Clerks;


