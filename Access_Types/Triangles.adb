-- -----------------------------------------------------------
-- |                                                          |
-- |                    Triangle package                      |
-- |                                                          |
-- -----------------------------------------------------------

-- a simple package with some types, two functions, and a procedure
-- to understand how Ada provides alternative ways for object 
-- allocation far from the constraints of their block structures 
-- this can be done through the access types

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


   function Check_Triangle(T : Triangle) return TriangleType is
      
      -- re define once you have implemented angle functions
   begin
      if T.Side(1) = T.Side(2) and T.Side(2) = T.Side(3) then
         return Equilateral;
      elsif T.Side(1) /= T.Side(2) and T.Side(2) /= T.Side(3) then
         return Scalene;
      else
         return Isosceles;
      end if;
             
   end Check_Triangle;


   ----------------
   -- Procedures --
   ----------------

   
   procedure Display_Triangle(T : Triangle) is

      -- declarative section
   begin
      New_Line;
      Put_Line("Kind           :  " & Check_Triangle(T)'Image);
      Put_Line("Sides          : "  & Float'Image(T.Side(1)) & Float'Image(T.Side(2)) & Float'Image(T.Side(3)));	
      Put_Line("Perimeter      : "  & Triangle_Perimeter(T)'Image);      

   end Display_Triangle;

end Triangles;