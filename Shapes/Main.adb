-- -----------------------------------------------------------
-- |                                                          |
-- |                    Multiple packages                     |
-- |                (it's a work in progress)                 |
-- |                                                          |
-- -----------------------------------------------------------

with Triangles;
with Ada.Text_IO;
with Ada.Float_Text_IO;


procedure Main is
	
	use Triangles;
	use Ada.Text_IO;
	use Ada.Float_Text_IO;
	
	
	T : Triangle := (Side => (2.0, 2.0, 2.0), Angle => (60.0, 60.0, 60.0));
		
begin
		
	Display_Triangle(T);
	
end Main;
