-- -----------------------------------------------------------
-- |                                                          |
-- |                      Aliased Objects                     |
-- |                 (aka general access type)                |
-- |                                                          |
-- -----------------------------------------------------------

-- there are two fundamental reasons to mark an object as aliased:
--    1 -> warning the programmer that such object can be manipulated indirectly
--    2 -> preventing the access to the object in the standard manner since the
--         compiler is forced to allocate space for the object in a non standard way  

with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Strings;
with Ada.Strings.Bounded;

procedure Main is
	use Ada.Text_IO;
	use Ada.Integer_Text_IO;
	use Ada.Strings;
	
	-- access types can also be used to provide indirect access to declared objects
	-- the declaration includes the word "all" and it is known as a general access type declaration
	type Int_Ptr is access all Integer;

	-- replacing "all" with "constant" in the type definition allows to restrict the access to be read-only
	type Const_Int_Ptr is access constant Integer;
	
	-- general acess types can also refer to composite types
	type String_Ptr is not null access all String;

	-- ragged array
	type G_String is access constant String;
	
	-----------------
	-- Declaration --
	-----------------

	-- pointers
	IP : Int_Ptr;
	CIP: Const_Int_Ptr;
	
	-- aliased
	I : aliased Integer;
	
	-- constant declaration requires initialization expression
	C : aliased constant Integer := 133;

	-- in the same way the components of an array can also be aliased
	AI: array(1..100) of aliased Integer;

	A_String: aliased String := "Hello!";
	SP: String_Ptr := A_String'Access;
	
	-- of course ragged arrays can also be aliased and strings,for instance, can be declared in the usual way
	-- with bounds obtained from their initial values
	R_String: aliased String := "Hello World!";
	RP: G_String := R_String'Access;
	
begin

	I   := 13;
	IP  := I'Access;
	CIP := I'Access;
	IP  := AI(I)'Access;
	
	-- print ** (the access value)
	Put_Line(IP.all'Image);
	
	-- print 13
	Put_Line(CIP.all'Image);

	-- print "Hello"
	Put_Line(" " & SP.all);

	-- the String could be also changed inderictly thorugh the pointer
	-- provided that the static matching between string constrains is respected
	-- (e.g., SP.all := "Yep" would raise a Constraint Error)
	SP.all := "Groovy";
	
	-- print "Groovy"
	Put_Line(" " & A_String);

	-- print "Hello World!"
	Put_Line(" " & RP.all);
	
	-- conversion between general access types is permitted (but IP := Int_Ptr(CIP) is illegal)
	CIP := Const_Int_Ptr(IP); 

	-- print ** (same as the above access value)
	Put_Line(CIP.all'Image);
	
end Main;
