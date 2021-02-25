
package Triangles is

	-- enumerative
	type TriangleType is (Equilateral, Isosceles, Scalene);

	-- new type
	type Triangle;
	-- access type of Triangle
	type Triangle_Ptr is access Triangle;
	
	-- respectively AB, BC, and AC 
	type Sides is array (Integer range 1 .. 3) of Float;

	-------------
	-- Records --
	-------------

	type Triangle is record
		Next : Triangle_Ptr := null;
		Side : Sides;        
    end record;
   
	------------------------
	-- Function signature --
	------------------------

	function Triangle_Perimeter (t : Triangle) return Float;
	
	function Check_Triangle(t : Triangle) return TriangleType;

	-------------------------
	-- Procedure signature --
	-------------------------
	
	procedure Display_Triangle(T : Triangle);


end Triangles;