-- -----------------------------------------------------------
-- |                                                          |
-- |                    Arrays and Records                    |
-- |                                                          |
-- -----------------------------------------------------------

-- Note that the following are all tests, that is why in some print statements are passed bare values 
-- and in others just their images. It doesn't mind the result, what matters is just the appropriate statement and structure 

with Ada.Text_IO, Ada.Integer_Text_IO; 

procedure Main is
	use Ada.Text_IO, Ada.Integer_Text_IO;

	type Weekday is (Mon, Tue, Wed, Thu, Fri, Sat, Sun) with Default_Value => Mon;
	
	subtype Workday is Weekday range Mon .. Fri;
	
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
	
	
	-- Record examples will be here as soon as possible!
	
end Main;
