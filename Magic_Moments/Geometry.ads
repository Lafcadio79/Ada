package Geometry is
  type Object is abstract tagged
    record
      X_Coord: Float := 2.45;
      Y_Coord: Float := 54.4;
    end record;

  function Distance(O: Object) return Float;
  function Area(O: Object) return Float is abstract;
  function MI(O: Object) return Float is abstract;
  function Name(O: Object) return String is abstract;

end Geometry;
