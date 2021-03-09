package Geometry.Squares is

  type Square is new Object with
    record
      Side: Float;
    end record;

    function Area(S: Square) return Float;
    function MI(S: Square) return Float;
    function Name(S: Square) return String;
    
end Geometry.Squares;
