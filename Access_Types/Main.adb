-- -----------------------------------------------------------
-- |                                                          |
-- |                       Access types                       |
-- |                                                          |
-- -----------------------------------------------------------

with Triangles;
with Ada.Text_IO;
with Ada.Float_Text_IO;

procedure Main is
	use Triangles;
	use Ada.Text_IO;
	use Ada.Float_Text_IO;

	T1 : Triangle := (Next => null, Side => (2.1, 2.1, 3.1));
	
	T2 : Triangle_Ptr;
begin

	T2 := new Triangle'(null, (1.1,2.2,3.3));
	
	
	-- print Kind  		:  ISOSCELES
	--       Sides 		:  2.10000E+00 2.10000E+00 3.10000E+00
    --       Perimeter  :  7.30000E+00
	Display_Triangle(T1);

	New_Line;

	-- print 1.10000E+00  2.20000E+00  3.30000E+00
	for i in T2.Side'Range loop
		Put(T2.Side(i), 3);
	end loop;
	
end Main;
