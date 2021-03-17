with Ada.Text_Io;
with Ada.Numerics.Elementary_Functions;

procedure Main is
	use Ada.Text_Io;
	use Ada.Numerics.Elementary_Functions;

	-- non-arbitrary bounded array
	type Vector is array(Integer range <>) of Float;
	
	-- an access to subprogram values can be created by the "access" attribute	
	type Math_Function is access function (F: Float) return Float;


	-- it is then possible to apply the previous function passed as parameter to an array of Floats
	procedure Iterate(Func: in not null Math_Function; V: in out Vector) is
	begin
		for I in V'Range loop
			-- overrides the array's elements with the new ones returned by the function passed as parameter
			V(I) := Func(V(I));
		end loop;		
	end Iterate;

	-- assigning an appropriate access to subprograms enable the use of  
	Do_It: Math_Function := Sin'Access;
	
	X, Theta: Float;

	V1 : Vector := (11.4, 3.12, 68.3, 3.46, 15.1);
begin
	
	Theta := 12.4;
	
	-- such assignment stands for X := Do_It.all(Theta);
	X := Do_It(Theta);

	-- print -1.65605E-01 i.e., Sin(Theta)
	Put_Line(X'Image);
	
	-- print 1.14000E+01  3.12000E+00  6.83000E+01  3.46000E+00  1.51000E+01
	for I in V1'Range loop
		Put(V1(I)'Image & " ");
	end loop;
	
	Iterate(Do_It, V1);
	
	New_Line;
	
	-- print -9.19329E-01  2.15911E-02 -7.27750E-01 -3.13054E-01  5.71197E-01
	for I in V1'Range loop
		Put(V1(I)'Image & " ");
	end loop;
	
end Main;
