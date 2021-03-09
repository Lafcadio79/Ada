with Geometry.Lists;    use Geometry.Lists;
with Geometry.Magic;    use Geometry.Magic;
with Ada.Text_IO;       use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Tabulate_Properties(The_List: List) is

  Local: access Cell := The_List;
  This_One: Pointer;

begin
  New_Line;
  Put("              X      Y        Area      MI      MO     Moment");
  New_Line;
  while Local /= null loop
    This_One := Local.Element;
    New_Line;
    Put(This_One.Name); Set_Col(10);
    Put(This_One.X_Coord, 4, 2, 0); Put(' ');
    Put(This_One.Y_Coord, 4, 2, 0); Put(' ');
    Put(This_One.Area, 6, 2, 0); Put(' ');
    Put(This_One.MI, 6, 2, 0); Put(' ');
    Put(MO(This_One.all), 6, 2, 0); Put(' ');
    Put(Moment(This_One.all), 6, 2, 0);

    Local := Local.Next;
  end loop;

end Tabulate_Properties;
