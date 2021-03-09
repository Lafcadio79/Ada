with Ada.Numerics;

package body Geometry.Circles is

  function Area(C: Circle) return Float is
  begin
    return Ada.Numerics.Pi * C.Radius**2;
  end Area;

  function MI(C: Circle) return Float is
  begin
    return 0.5 * C.Area * C.Radius**2;
  end MI;

  function Name(C: Circle) return String is
  begin
    return "Circle";
  end Name;

end Geometry.Circles;
