-- -----------------------------------------------------------
-- |                                                          |
-- |               Object Oriented Programming                |
-- |            											  |
-- -----------------------------------------------------------


-- Simple OOP example
-- The Clerks program provides to insert, delete, and modify the list of clerks of a store.
-- It is made up of an interface, its body, and a main.
-- Each clerk is identified by an ID, name, surname, birthday, age, address, and an alfanumeric SSN 

with Ada.Text_IO;
with Ada.Integer_Text_IO;

package body Clerks is
	use Ada.Text_IO;
	use Ada.Integer_Text_IO;
	
	function get_ID(C: Clerk) return Integer is 
	-- declarative part
	begin
		return C.ID;
	end get_ID;
	
	
	function get_Name(C: Clerk) return String_ref is
	-- declarative part
	begin
		return C.Name;
	end get_Name;
	
	function get_Surname(C: Clerk) return String_ref is
	-- declarative part
	begin
		return C.Surname;
	end get_Surname;
	
	function get_Age(C: Clerk) return Integer is
	-- declarative part
	begin
		return C.Age;
	end get_Age;

	function get_Birthday(C: Clerk) return Date is
	-- declarative part
			D: Date := (C.Birth.Day, C.Birth.Month, C.Birth.Year);
	begin
		return D;
	end get_Birthday;
	
	function get_Address(C: Clerk) return Address is
	-- declarative part
		Addr: Address := (C.Addr.Street, C.Addr.Number);		
	begin
		return Addr;		
	end get_Address;
	
	procedure Print_Clerk(C: Clerk) is
	-- declarative part
		ID: Integer := get_ID(C);
		Name: String_ref := get_Name(C);
		Surname: String_ref := get_Surname(C);
		Birth: Date := get_Birthday(C);
		Age: Integer := get_Age(C);
		Addr: Address := get_Address(C);
	begin
		Put_Line("ID:            " & ID'Image);
		Put_Line("Name:           " & Name.all);
		Put_Line("Surname:        " & Surname.all);
		Put_Line("Date of birth: " & Birth.Day'Image & " - " & Birth.Month'Image & " -" & Birth.Year'Image);
		Put_Line("Age:           " & Age'Image);
		Put_Line("Address:        " & Addr.Street.all & " " & Addr.Number.all);
	end Print_Clerk;
	
end Clerks;
