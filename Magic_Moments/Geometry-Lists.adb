package body Geometry.Lists is

  procedure Add_To_List(The_List: in out List; Obj_Ptr: in Pointer) is
  begin
    The_List := new Cell'(The_List, Obj_Ptr);
  end Add_To_List;

end Geometry.Lists;
