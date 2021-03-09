package body Geometry.Magic is

  function Moment(OC: Object'Class) return Float is
  begin
    return OC.X_Coord * OC.Area;
  end Moment;

  function MO(OC: Object'Class) return Float is
  begin
    return OC.MI + OC.Area * OC.Distance**2;
  end MO;
  
end Geometry.Magic;
