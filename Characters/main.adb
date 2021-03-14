-- -----------------------------------------------------------
-- |                                                          |
-- |               Ada's Default Character Map                |
-- |                       (easy busy)        			          |
-- |														                              |
-- -----------------------------------------------------------

with Ada.Text_IO;

procedure Main is
	use Ada.Text_IO;
	
	C : Character;
begin

	for J in 1 .. 255 loop
		Put(C & " ");
		C := Character'Succ(C);
	end	loop;
	
end Main;
