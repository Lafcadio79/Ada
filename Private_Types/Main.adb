--------------------------------
--       private types        --
--------------------------------

with Ada.Text_IO;
with Ada.Float_Text_IO;
with Complex_Numbers;

procedure Main is
	use Ada.Text_IO;
	use Ada.Float_Text_IO;
	use Complex_Numbers;
	
	-- declarative part
	C, D: Complex;
	F: Float;
	
begin
	C := Cons(1.5, -6.0);
	-- remember the private constant?
	D := C + I;          -- Complex +
	
	-- print -5.0000E+00 (i.e., -6.0 + 1.0)
	Put(Im_Part(D)'Image);
	
	New_Line;

	-- i.e., 1.5 + 6.0
	F := Re_Part(D) + 6.0;

	-- print 7.50000E+00
	Put(F'Image);

end Main;
