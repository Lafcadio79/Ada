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

package Humans is
	------------------------
	-- Types and subtypes --
	------------------------
	
	type String_Ref is access String;

	type Months is (Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec);
	
	type Weekdays is (Mon, Tue, Wed, Thu, Fri, Sat, Sun);

--	type Gender_Char is ('M', 'F');
	
	subtype Sub_Int is Integer range 1 .. 120;
	
	-------------
	-- Records --
	-------------

	type Date is 
		record
			Day   : Integer range 1 .. 31;
			Month : Months;
			Year  : Integer range 1 .. 99999;
		end record;
	
	type Human is tagged
		record
			Name    : String_Ref;
			Surname : String_Ref;
			Birth   : Date;
			Age	: Sub_Int;
			Gender  : Character;
			IDCode  : String_ref;
		end record;
		
	function CurrentAge(H: Human) return Sub_Int;
	
end Humans;
