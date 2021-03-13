-- -----------------------------------------------------------
-- |                                                          |
-- |                    Strings manipulation                  |
-- |                                                          |
-- -----------------------------------------------------------

with Ada.Text_IO;
with Ada.Strings;
with Ada.Strings.Fixed;
with Ada.Strings.Bounded;
with Ada.Strings.Unbounded;

procedure Main is
	use Ada.Text_IO;
	use Ada.Strings;
	use Ada.Strings.Fixed;
	use Ada.Strings.Unbounded;
	-- to leverage the bounded string type it is mandatory to set its length in advance and then use it as new length type 
	package B_Str_80 is new
		Ada.Strings.Bounded.Generic_Bounded_Length(80);
	use B_Str_80;

	-- declarative section
	I   : Integer := 2; 
	J   : Integer := 7; 
	
	C   : Character;
	S   : String := "Barbara";
	S5  : String(1 .. 5);
	S10 : String(1 .. 10);
	S15 : String(1 .. 15);
	
	BS  : Bounded_String   := To_Bounded_String("A bounded string");
	US  : Unbounded_String := To_Unbounded_String("An unbounded string");
	
begin

	-- we can also use procedures once we have declared the variable type without an explicit initialization as follows:
	-- Set_Bounded_String(BS, "A bounded string");
	-- Set_Unbounded_String(US, "An unbounded string");
	
	-- If you wanna print them, you must perform a To_String casting operation (because of the control type required by Ada)
	-- print "A bounded string"
	Put(To_String(BS));
	New_Line;
	-- print "An unbounded string"
	Put_Line(To_String(US));

	BS := BS & ' ' & "Barnes";
	-- in the same way you could perform the above operation as:
	-- BS := Append(BS, ' ' & "Barnes");
	-- Append(BS, "Barnes");

	-- print "A bounded string Barnes"
	Put(To_String(BS));
	New_Line;
	Move(S, S10);
	Move(S10, S5, Drop => Right);
	-- print "Barbara"
	Put(S);
	New_Line;
	-- print "Barbara   "
	Put(S10);
	New_Line;
	-- print "Barba"
	Put(S5);
	New_Line;
	
	-- lazy assignment to the same bounded variable
	BS := 2 * "Bar";
	US := 3 * "A";
	
	-- print "BarBar" (casting obviously)
	Put(To_String(BS));
	New_Line;
	-- print "AAA"
	Put(To_String(US));
	New_Line;
	
	-- have a look to the string length declaration
	S15 := 5* "SOS";
	-- print "SOSSOSSOSSOSSOS"
	Put(S15);
	New_Line;
	
	-- extract the i-th element from US (i.e., the 2nd one)
	C := Element(US, I);
	-- print "A"
	Put(C);
	New_Line;
	
	-- replace the i-th element
	Replace_Element(BS, I, C);
	-- print "BArBar"
	Put(To_String(BS));
	New_Line;
	
	-- extract elements I to J 
	Set_Unbounded_String(US, "An unbounded string");
	S(I..J) := Slice(US, I, J);
	-- print Bn unbo (remember remember the above S assignment)
	Put(S);
	New_Line;
	
	-- replace elements 4 to 12
	Replace_Slice(US, 4, 12, "unuseful");
	-- print "An unuseful string"
	Put(To_String(US));
	New_Line;
	
end Main;
