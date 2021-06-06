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

with Utility;

package body Clerks is
	use Utility;
	
	function Get_ID(C: Clerk) return Integer is
	-- declarative part
	begin
	
		return C.ID;
		
	end get_ID;

	function Get_New_Clerk return Clerk is
	
		Name    : String_Ref;
		Surname : String_Ref;
		Age		: Sub_Int;
		Gender  : Character;
		IDCode  : String_ref;
		Day     : Integer range 1 .. 31;
		IMonth  : Integer range 1 .. 12;
		Month   : Months;
		Year    : Integer range 1 .. 99999;
		ID		: Integer;
		IWDays	: Integer range 1 .. 5;
		WDays	: Workday;
	begin
		
		Put("Name: "); 				 	 Name    := new String'(Get_String);
		Put("Surname: ");            	 Surname := new String'(Get_String);
		Put_Line("Birth (d-m-y): ");
		Put(" Day >");               	 Day     := Get_Integer;
		Put_Line(" Month >");
		Put_Line("  Jan => 0 - ... - Dec => 11");
										 IMonth  := Get_Integer;
										 Month   := Months'Val(IMonth);
		Put(" Year >");              	 Year    := Get_Integer;
		Put("Age: ");                	 Age     := Get_Integer;
		Put("Gender [M/F]: ");       	 Gender  := Get_Character;
		Put("ID code: "); 	         	 IDCode  := new String'(Get_String);
		Put("ID clerk: "); 	             ID      := Get_Integer;
		Put_Line("Working days > ");
		Put_Line("  Mon => 0 - ... - Fri => 4");
										 IWDays  := Get_Integer;
										 WDays   := Workday'Val(IWDays); 
										 
		return (Name, Surname, (Day,Month,Year), Age, Gender, IDCode, ID, WDays);
				
	end Get_New_Clerk;

	
	procedure Print_Clerk(C: Clerk) is
		
		-- declarative part
		N: String_ref  := C.Name;
		S: String_ref  := C.Surname;
		B: Date 	   := (C.Birth.Day, C.Birth.Month, C.Birth.Year);
		A: Sub_Int     := C.Age;
		G: Character   := C.Gender;
		I: String_ref  := C.IDCode;
		W: Workday	   := C.WDays;
		
	begin
		New_Line(2);
		Put_Line("Name:     " & N.all);
		Put_Line("Surname:  " & S.all);
		Put_Line("Birth:   " & B.Day'Image & " - " & B.Month'Image & "- " & B.Year'Image);
		Put_Line("Age:     " & A'Image);
		Put_Line("Gender:   " & G'Image);
		Put_Line("ID Code:  " & I.all);
		Put_Line("ID:      " & get_ID(C)'Image);
		Put_Line("Workday:  " & W'Image);
		New_Line;

	end Print_Clerk;

end Clerks;