with Ada.Numerics.Elementary_Functions;

package body Geometry.Triangles is
  use Ada.Numerics.Elementary_Functions;

  function Area(T: Triangle) return Float is
    S: constant Float := 0.5 * (T.A + T.B + T.C);
  begin
    return Sqrt(S * (S-T.A)*(S-T.B)*(S-T.C));
  end Area;

  function MI(T: Triangle) return Float is
  begin
    return T.Area * (T.A**2 + T.B**2 + T.C**2) / 36.0;
  end MI;

  function Name(T: Triangle) return String is
  begin
    return "Triangle";
  end Name;
  
end Geometry.Triangles;
