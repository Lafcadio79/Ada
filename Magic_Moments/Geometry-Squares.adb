package body Geometry.Squares is

  function Area(S: Square) return Float is
  begin
    return S.Side**2;
  end Area;

  function MI(S: Square) return Float is
  begin
    return  S.Area * S.Side**2 / 6.0;
  end MI;

  function Name(S: Square) return String is
  begin
    return "Square";
  end Name;
  
end Geometry.Squares;
