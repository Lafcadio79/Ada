-- -----------------------------------------------------------
-- |                                                          |
-- |               Object Oriented Programming                |
-- |            											  |
-- -----------------------------------------------------------

-- ONGOING EXAMPLE

-- Simple OOP example
-- The Clerks program provides to insert, delete, and modify the list of clerks of a store.
-- It is made up of an interface, its body, and a main.
-- Each clerk is identified by an ID, name, surname, birthday, age, address, and an alfanumeric SSN 

with Clerks;
with Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure Main is
	use Clerks;
	use Ada.Text_IO;
	use Ada.Integer_Text_IO;
	
	C: Clerk;
	N: String_ref := new String'("Adam"); 
	S: String_ref := new String'("Sandler");
	A: String_ref := new String'("Mulholland Drive");
	W: String_ref := new String'("34A");
begin

	
	C := (1, N, S, (09, Sep, 1966), 55, (A, W));
	
	Print_Clerk(C);

end Main;
