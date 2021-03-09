with Geometry.Lists; use Geometry;
with Geometry.IO;    use Geometry.IO;
with Ada.Text_IO;    use Ada.Text_IO;

procedure Build_List(The_List: in out Lists.List) is

  Code_Letter: Character;
  Object_Ptr: Lists.Pointer;

  begin
      loop
        loop  -- loop to skip leading spaces
          Get(Code_Letter);
          exit when Code_Letter /= ' ';
        end loop;
        case Code_Letter is
          when 'C'|'c' =>  --expect a circle
            Object_Ptr := Get_Circle;
          when 'T'|'t' =>  --expect a triangle
            Object_Ptr := Get_Triangle;
          when 'S'|'s' =>  --expect a square
            Object_Ptr := Get_Square;
          when others => exit;
        end case;

        Lists.Add_To_List(The_List, Object_Ptr);

      end loop;

end Build_List;
