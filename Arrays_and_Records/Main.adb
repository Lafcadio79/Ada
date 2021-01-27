-- -----------------------------------------------------------
-- |                                                          |
-- |                    Arrays and Records                    |
-- |                                                          |
-- -----------------------------------------------------------

-- Note that the following are all tests, that is why in some print statements are passed bare values 
-- and in others just their images. It doesn't mind the result, what matters is just the appropriate statement and its structure 

with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Strings.Unbounded;
procedure Main is
	use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Strings.Unbounded;

	-- other than the standard enumeration types like
	type Weekday is (Mon, Tue, Wed, Thu, Fri, Sat, Sun) with Default_Value => Mon;
	-- and the possibility to define subtypes made up of the defined types
	subtype Workday is Weekday range Mon .. Fri;
	-- there's aldo possible to declare an enumeration type in which some or all values are represented by character literals
	type Roman_Digits is ('I', 'V', 'X', 'L', 'C', 'D', 'M');
	
	
	-- A typical one-dimensional array declaration
	Arr    : array(Integer range 1.. 10) of Float;
	-- A two-dimensional array declaration (a 5x5 matrix)
	Arr_2D : array(Integer range 1 .. 5, Integer range 1 .. 5) of Float;
	-- Array declaration with initial values
	Arr_Exp : array(Integer range 1 .. 5) of Integer := (4,7,6,2,5);
	-- Array declaration using a new_type for range
	Hours_Worked : array(Weekday) of Float;
	-- An array can be declared as constant in which case an initial value is mandatory
	Work_Day : constant array(Workday) of Boolean := (True, True, True, True, True); 

	-- The arrays introduced so far do not have an explicit type name. Here's an example of type name array declaration
	type Vector_10 is array (1 .. 10) of Integer;
	
	-- Sometimes could be useful to declare a non arbitrary bounded array.
	-- In such case Ada allows the declaration of unconstrained arrays.
	-- The following example shows the declaration of a one-dimensional array of Float components with an Integer index
	-- (the compund symbol <> is read as 'box')
	type Vector is array(Integer range <>) of Integer;
	
	-- Another useful type declaration is
	type Matrix is array(Integer range <>, Integer range <>) of Integer;
	-- that allows to introduce subtypes as
	subtype Matrix_5 is Matrix(1 .. 5, 1 .. 5);
	-- or it is also possible declare a new type with default component values in this way
	type Default_Matrix is array(1 .. 10, 1 .. 10) of Integer with Default_Component_Value => 9;
	-- and its subtype as
	subtype Matrix_10 is Default_Matrix;

	-- and then
	M5 : Matrix_5;
	M10 : Matrix_10;
	
	-- another possibility is to declare named aggregates
	Aggregate_Unit_3 : constant Matrix := (1 => (1 => 12, 2 => 45, 3 => 77), 2 => (1 => 24, 2 => 90, 3 => 154), 3 => (1 => 36, 2 => 125, 3 => 231));


	-- other variables
	Hours : Float := 0.0;
	begin
		
		-- if the following expressions have values outside the bounds of the array range,
		-- then the exception Constraint_Error will be raised. That is why it is important 
		-- to know how to properly use the Range and Length attributes 
	
		-- initialisation of single array elements 
		for I in 1 .. Arr'Length loop
			Arr(I) := 0.0;
		end loop;
	
		-- initialisation of 2-dimensional array elements
		for I in Arr_2D'Range(1) loop
			for J in Arr_2D'Range(2) loop
				Arr_2D(I, J) := 0.0;
			end loop;
		end loop;
	
		New_Line;
	
		-- initialisation of new_type array of floats
		for I in Weekday loop
			Hours_Worked(I) := 8.0;
			Hours := Hours + 8.0;
			if Hours = 40.0 then
				Put("Maximum working hours limit!");
				exit;
			end if;
		end loop;
	
		New_Line(2);
	
		-- print 4  7  6  2  5
		for E in Arr_Exp'Range loop
			Put(Arr_Exp(E)'Image & " ");
		end loop;
		
		-- The advantage of using a type name for an array is that it enables us to assign
		-- the whole type name array in one statement
		declare
			Arr_Type : Vector_10 := (1,2,3,4,5,9,8,7,6,0);
			
			begin
				New_Line(2);
				
				-- print  1  2  3  4  5  9  8  7  6  0
				for I in Arr_Type'Range loop
					Put(Arr_Type(I)'Image & " ");
				end loop;
		end;
		
		New_Line(2);
		
		-- Initialisation of a unconstrained array with n values (i.e. a vector as the given type name suggests)
		declare
			V1 : Vector := (5,432,423,4,324,3,5,4,6546,54,6,4,66,54,6,45,6456,5);
			begin
				-- now print 5 432 423 4 324 3 5 4 6546 54 6 4 66 54 6 45 6456 5
				for I in V1'Range loop
					Put(V1(I)'Image & " ");
				end loop;

		end;
		
		New_Line(2);
		
		-- Initialisation of a subtype of Matrix
		for I in M5'Range(1) loop
			for J in M5'Range(2) loop
				M5(I, J) := I * J;
			end loop;
		end loop;
		
		-- and print
		for I in M5'Range(1) loop
			for J in M5'Range(2) loop
				Put(M5(I, J), 3);
			end loop;
			New_Line;
		end loop;

		New_Line(2);
		
		-- and now print the 10x10 subtype matrix with default component values
		for I in M10'Range(1) loop
			for J in M10'Range(2) loop
				Put(M10(I, J), 3);
			end loop;
			New_Line;
		end loop;

		New_Line(2);
		
		-- print the aggregate matrix already initialised
		for I in Aggregate_Unit_3'Range(1) loop
			for J in Aggregate_Unit_3'Range(2) loop
				Put(Aggregate_Unit_3(I,J), 4);
			end loop;
			New_Line;
		end loop;
		
		New_Line;
		
		-- (type of) characters and strings
		declare
			Dig: Roman_Digits := 'D';
			begin
				-- print 'I'
				Put_Line(Roman_Digits'First'Image);
				-- print 'Yep'
				if (Dig > 'L') then
					Put_Line("Yep");
				else
					Put("No, Sherlock!");
				end if;
		end;

		-- there's also a pre-defined enumerator type Character which is (naturally) a character type
		-- print 'NUL'
		Put_Line(Character'First'Image);

		-- As well as the predefined enumerator Character there's also the predefined array type String declared as follows
		-- type String is array (positive range <>) of Character;
		declare
			-- declare an array  of range 1 .. 7
			S : String (1 .. 7) := ('H', 'E', 'L', 'L', 'O', 'W', 'O');
			G1 : constant String := ('P', 'I', 'G');
			G2 : String := "PIG";
			begin
				-- print 1
				Put_Line(S'First'Image);
				-- print 1
				Put_Line(G1'First'Image);
				-- print PI
				Put_Line(G2(1 .. 2));
		end;
		
		New_Line;
		
		-- once a type has been declared we can use it to define any other structure of that type
		declare
			type Roman_Number is array (Positive range <>) of Roman_Digits;
			NineteenEighty_Four : constant Roman_Number := "MCMLXXXIV"; 
			begin
				-- print 'M' 'C' 'M' 'L' 'X' 'X' 'X' 'I' 'V'
				for I in NineteenEighty_Four'Range loop
					Put(NineteenEighty_Four(I)'Image);
				end loop;
		end;
		
		
		-- Records
		
		-- A record is a composite object consisting of named components which may be of different types.
		-- In contrast to arrays we cannot have anonymous record types, they all have to be named
		
		New_Line(2);
		
		declare

			type Month_Name is (Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec);

			type Subject is (History, Mathematics, Literature);
			type Score is array (Subject) of Integer range 0 .. 100;
			
			-- a record without default vaues
			type Date is 
				record
					Day   : Integer range 1 .. 31;
					Month : Month_Name;
					Year  : Integer;
				end record;
			
			-- a record with default values
			type Complex is
				record
					Re : Float := 0.0;
					Im : Float := 0.0;
 				end record;
			
			-- a record type may have any number of components. It may even have none,
			-- in which case we must either write the component list as null; or use
			-- the abbreviated form
			type Hole is null record;
			
			-- a more elaborate example of record is given by teh following, where the record Student has
			-- two components, the first is another record and the second an array (that has default values of zero)
			type Student is
				record
					Name   : Unbounded_String;
					Birth  : Date;
					Finals : Score := (others => 0);
				end record;

			-- declaration of an object D1, which is a Date
			D1 : Date;
			-- or all in one statement
			D2 : Date := (1, Jan, 1970);
			-- in a named aggregate structure, as a record is, the components may be in any order
			D3 : Date := (Month => Jul, Year => 1776, Day => 4);

			C1 : Complex;
			C2 : Complex := (Re | Im => 1.0);
			
			S1 : Student := (To_Unbounded_String("Asdrubale"), D3, (History => 9, Mathematics => 8, Literature => 10));
			
			-- procedure that prints a Date object (record)
			procedure Display_Date(D : Date) is
				begin
					New_Line;
					Put_Line("Day  : " & Integer'Image(D.Day));
					Put_Line("Month: " & Month_Name'Image(D.Month));
					Put_Line("Year : " & Integer'Image(D.Year));
			end Display_Date;
				
			-- procedure that prints a Complex
			procedure Display_Complex(C : Complex) is
				begin
					New_Line;
					Put_Line("X : " & C.Re'Image);
					Put_Line("iY: " & C.Im'Image);
			end Display_Complex;
			
			-- procedure that prints the Student information
			procedure Display_Students(S : Student) is
				begin
					New_Line;
					Put_Line("Name : " & To_String(S.Name));
					Display_Date(S.Birth);
					Put_Line("History : " & S.Finals(History)'Image);
					Put_Line("Mathematics : " & S.Finals(Mathematics)'Image);
					Put_Line("Literature : " & S.Finals(Literature)'Image);
			end Display_Students;
				
			begin
								
				-- assignment of new values to individual object components 
				D1.Day   :=  21;
				D1.Month :=  Apr;
				D1.Year  :=  1979;
			
				-- and print
				Display_Date(D1);
				Display_Date(D2);
				Display_Date(D3);
				
				-- print with default values
				Display_Complex(C1);
				-- print with assigned values
				Display_Complex(C2);
				
				Display_Students(S1);
			end;
		
end Main;
