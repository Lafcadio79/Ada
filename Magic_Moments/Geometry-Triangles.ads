package Geometry.Triangles is

  type Triangle is new Object with
    record
        A, B, C: Float; -- lengths of sides
    end record;

  function Area(T: Triangle) return Float;
  function MI (T: Triangle) return Float;
  function Name(T: Triangle) return String;

end Geometry.Triangles;
