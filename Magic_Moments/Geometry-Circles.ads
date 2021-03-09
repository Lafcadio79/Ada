package Geometry.Circles is

  type Circle is new Object with
    record
      Radius: Float;
    end record;

    function Area(C: Circle) return Float;
    function MI(C: Circle) return Float;
    function Name(C: Circle) return String;

end Geometry.Circles;
