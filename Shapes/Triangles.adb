with Ada.Text_IO;
with Ada.Float_Text_IO;
with Ada.Numerics.Elementary_Functions;

package body Triangles is

   use Ada.Text_IO;
   use Ada.Float_Text_IO;
   use Ada.Numerics.Elementary_Functions;

   ---------------
   -- Functions --
   ---------------
	
   -- computer the perimeter of the given triangle's kind
   function Triangle_Perimeter (T : Triangle) return Float is
	
      -- declarative section
   begin
      -- function body
      return T.Side(1) + T.Side(2) + T.Side(3);
      
   end Triangle_Perimeter;

   function Triangle_SemiPerimeter (T : Triangle) return Float is
      Tp : Float := Triangle_Perimeter(T);
   
   begin
      return Tp / 2.0;
      
   end Triangle_SemiPerimeter;
   
   -- compute the area of the given triangle's kind
   function Triangle_Area (T : Triangle) return Float is
      -- declarative section
      sp : Float := Triangle_Perimeter(T) / 2.0;
   begin
      -- function body
      return  Sqrt(sp * (sp - T.Side(1)) * (sp - T.Side(2)) * (sp - T.Side(3)));
      
   end Triangle_Area;   
   
   function Triangle_Heights(T : Triangle) return Heights is
      -- declarative section
      DA : Float := 2.0 * Triangle_Area(T);
      Hs : Heights;
   begin
      -- you should re-program the following code based on the triangle's kind
      for i in 1 .. 3 loop
         Hs(i) := DA / T.Side(i); 
      end loop;
      
      return Hs;
        
   end Triangle_Heights;
    
   
   function Triangle_Medians(T : Triangle) return Medians is
      -- declarative section
      Ms : Medians;
      AB : Float := T.Side(1) ** 2.0;
      BC : Float := T.Side(2) ** 2.0;
      AC : Float := T.Side(3) ** 2.0;

   begin
      Ms(1) := 0.5 * Sqrt(2.0 * (AB + AC) - BC);
      Ms(2) := 0.5 * Sqrt(2.0 * (AB + BC) - AC);
      Ms(3) := 0.5 * Sqrt(2.0 * (BC + AC) - AB);
      
      return Ms;
      
   end Triangle_Medians;
   
   
   function Triangle_Area_from_Height (T : Triangle) return Float is
      -- declarative section
      Hs : Heights := Triangle_Heights(T);
   begin
      if T.Side(1) /= 0.0 then
         return Hs(3) * T.Side(1) / 2.0;
      elsif T.Side(2) /= 0.0 then
         return Hs(1) * T.Side(2) / 2.0;
      else
         return Hs(2) * T.Side(3) / 2.0; 
      end if;
      
   end Triangle_Area_from_Height;
    
   
   function Triangle_Check(T : Triangle) return TriangleType is
      
      -- re define once you have implemented angle functions
   begin
      if T.Side(1) = T.Side(2) and T.Side(2) = T.Side(3) then
         return Equilateral;
	  elsif T.Side(1) /= T.Side(2) and T.Side(2) /= T.Side(3) then
         return Scalene;
      else
         return Isosceles;
      end if;
             
   end Triangle_Check;

   ----------------
   -- Procedures --
   ----------------

   
   procedure Display_Triangle(T : Triangle) is
      -- declarative section
      Hs : Heights := Triangle_Heights(T);
      Ms : Medians := Triangle_Medians(T);
      
   begin
      New_Line;
      Put_Line("Kind           :  " & Triangle_Check(T)'Image);
      Put_Line("Sides          : "  & Float'Image(T.Side(1)) & Float'Image(T.Side(2)) & Float'Image(T.Side(3)));	
      Put_Line("Angles         : "  & Float'Image(T.Angle(1)) & Float'Image(T.Angle(2)) & Float'Image(T.Angle(3)));	
      Put_Line("Area           : "  & Triangle_Area(T)'Image);
      Put_Line("Perimeter      : "  & Triangle_Perimeter(T)'Image);
      Put_Line("SemiPerimeter  : "  & Triangle_SemiPerimeter(T)'Image);
      Put_Line("Height_a       : "  & Hs(1)'Image);
      Put_Line("Height_b       : "  & Hs(2)'Image);
      Put_Line("Height_c       : "  & Hs(3)'Image);
      Put_Line("Median_a       : "  & Ms(1)'Image);
      Put_Line("Median_b       : "  & Ms(2)'Image);
      Put_Line("Median_c       : "  & Ms(3)'Image);
      
   end Display_Triangle;

end Triangles;
