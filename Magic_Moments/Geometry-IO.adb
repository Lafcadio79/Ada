with Ada.Text_IO;
with Ada.Float_Text_IO;

with Geometry.Circles;
with Geometry.Squares;
with Geometry.Triangles;

package body Geometry.IO is
  use Ada.Text_IO;
  use Ada.Float_Text_IO;

  function Get_Circle return Lists.Pointer is
    use Circles;

    X_Coord: Float;
    Y_Coord: Float;
    Radius: Float;

  begin
    Get(X_Coord);
    Get(Y_Coord);
    Get(Radius);

    return new Circle'(X_Coord, Y_Coord, Radius);

  end Get_Circle;

  function Get_Triangle return Lists.Pointer is
    use Triangles;

    X_Coord: Float;
    Y_Coord: Float;
    A, B, C: Float;

  begin
    Get(X_Coord);
    Get(Y_Coord);
    loop
      Get(A); Get(B); Get(C);
      -- check to ensure a valid triangle
      exit when A < B + C and B < A + C and C < A + B;

      Put("Sorry, not a triangle, enter sides again please" );
      New_Line;
    end loop;

    return new Triangle'(X_Coord, Y_Coord, A, B, C);

  end Get_Triangle;

  function Get_Square return Lists.Pointer is
    use Squares;

    X_Coord: Float;
    Y_Coord: Float;
    Side: Float;

  begin
    Get(X_Coord);
    Get(Y_Coord);
    Get(Side);

    return new Square'(X_Coord, Y_Coord, Side);

  end Get_Square;

end Geometry.IO;
