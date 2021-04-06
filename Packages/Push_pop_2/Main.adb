--------------------------------
--        PUSH AND POP        --
--   (appropriate structure)  --
--------------------------------


-- using an array (fixed length) and an index variable
-- that points to the current top element, we declare a 
-- procedure to add, and a function to remove, elements
-- in and from the array respectively.  

with Stack;
with Ada.Text_IO;

procedure Main is
	use Stack;
	use Ada.Text_IO;

	
begin
	
	-- fill the array 
	for I in 1 .. 100 loop
		Push(I);
	end loop;
	
	-- get array elements
	for I in 1 .. 100 loop
		Put(Pop'Image & " ");
	end loop;
	
end Main;
