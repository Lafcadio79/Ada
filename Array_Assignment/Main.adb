-- -----------------------------------------------------------
-- |                                                          |
-- |                    Arrays initialisation                 |
-- |                                                          |
-- -----------------------------------------------------------

with Ada.Text_IO;

procedure Main is
	use Ada.Text_IO;
	
	type Arr_Type is array (Integer range<>) of Integer;
	
	A1: Arr_Type (1 .. 10);
	A2: Arr_Type (1 .. 3);

begin

	A1 (1) := 20;
	A1 (2) := 13;
	A1 (3) := 19;
	A1 (4) := 61;
	A1 (5) := 17;
	A1 (6) := 13;
	A1 (7) := 11;
	A1 (8) := 98;
	A1 (9) := 14;
	A1 (10) := 77;

	A2(2..3) := A1(4 .. 5);
	
	for i in A1'Range loop
		Put(A1(i)'Image & " ");		
	end loop;
  
	New_Line;
  
	-- note that the A2(0) has implicitly been initialised  
  for i in A2'Range loop
		Put(A2(i)'Image & " ");		
	end loop;
	
end Main;
