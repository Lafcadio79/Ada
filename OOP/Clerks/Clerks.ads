-- -----------------------------------------------------------
-- |                                                          |
-- |               Object Oriented Programming                |
-- |            											  |
-- -----------------------------------------------------------


-- Simple OOP example
-- The Clerks program provides to insert, delete, and modify the list of clerks of a store.
-- It is made up of an interface, its body, and a main.
-- Each clerk is identified by an ID, name, surname, birthday, age, address, and an alfanumeric SSN 

package Clerks is

	type String_ref is access String;

	type Months is (Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec);

	type Date is 
		record
			Day   : Integer range 1 .. 31;
			Month : Months;
			Year  : Integer range 1 .. 9999;
		end record;
		
	type Address is
		record
			Street: String_ref;
			Number: String_ref;
		end record;
		
	type Clerk is
		record
			ID: Integer;
			Name: String_ref;
			Surname: String_ref;
			Birth: Date;
			Age: Integer range 18 .. 70;
			Addr: Address;
		end record;
		
	function get_ID(C: Clerk) return Integer;
	function get_Name(C: Clerk) return String_ref;
	function get_Surname(C: Clerk) return String_ref;
	function get_Birthday(C: Clerk) return Date;
	function get_Age(C: Clerk) return Integer;
	function get_Address(C: Clerk) return Address;
	
	procedure Print_Clerk(C: Clerk);
	
end Clerks;
