-- -----------------------------------------------------------
-- |                                                          |
-- |                        Execute                           |
-- |                                                          |
-- -----------------------------------------------------------


with Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO; 

with New_Type;

procedure Main is
	use Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO;
	use New_Type;

	-- how to declare constants
	PI : constant Float := 3.14159_26535;
	A  : constant Integer := 8#421#;
	
	
	M  : Month;
	WS : Wheel_State := Up;
	Def_Col: Colour;
	B : Boolean := Amber not in Green .. Red;
	begin
		M := Apr;
		
		Put_Line(A'Image);
		
		Put_Line(Weekday'Last'Image);
		
		Put_Line(Colour'Succ(Colour'First)'Image);
		
		Put_Line(Stone'Pred(Quartz)'Image);
		
		Put_Line(M'Image);
		
		if(WS = Up) then
			Put_Line(WS'Image);
		end if;
		
		Put_Line(Def_Col'Image);
		
		Put_Line(B'Image);
				
		Put(2.0 * PI);
		
end Main;
