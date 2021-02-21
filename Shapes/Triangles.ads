package Triangles is

   -- enumerative
   type TriangleType is (Equilateral, Isosceles, Scalene, Right_angled);	
   -- respectively alpha, beta, and gamma
   type Angles is array (Integer range 1 .. 3) of Float; 
   -- respectively AB, BC, and AC 
   type Sides is array (Integer range 1 .. 3) of Float;
   -- respectively hA, hB, and hC
   type Heights is array (Integer range 1 .. 3) of Float;
   -- respectively mA, mB, and mC
   type Medians is array (Integer range 1 .. 3) of Float;
   
   -------------
   -- Records --
   -------------

   type Triangle is record
      Side  : Sides;        
      Angle : Angles;
   end record;
   
   -------------------------
   -- Function signatures --
   -------------------------

   function Triangle_Perimeter(T : Triangle) return Float;

   function Triangle_SemiPerimeter(T : Triangle) return Float;
	
   function Triangle_Area(T : Triangle) return Float;

   function Triangle_Heights(T : Triangle) return Heights;
   
   function Triangle_Area_from_Height(T : Triangle) return Float;
   
   function Triangle_Medians(T : Triangle) return Medians;

   function Triangle_Check(T : Triangle) return TriangleType;
   
   --------------------------
   -- Procedure signatures --
   --------------------------
	
   procedure Display_Triangle(T : Triangle);

end Triangles;
