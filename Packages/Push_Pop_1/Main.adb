--------------------------------
--        PUSH AND POP        --
--       (rough version)      --
--------------------------------

-- using an array (fixed length) and an index variable
-- that points to the current top element, we declare a 
-- procedure to add, and a function to remove, elements
-- in and from the array respectively.  

with Ada.Text_IO;

procedure Main is
	use Ada.Text_IO;

	Max: constant := 100;
	S: array(1 .. Max) of Integer;
	Top: Integer range 0 .. Max;
	
	----------------
	-- procedures --
	----------------
	procedure Push(X: in Integer) is
	begin
		Top := Top + 1;
		S(Top) := X;
	end Push;

	----------------
	-- functions  --
	----------------
	function Pop return Integer is
	begin
		Top := Top - 1;
		return S(Top + 1);
	end Pop;

begin
	
	-- fill the array 
	for I in 1 .. Max loop
		Push(I);
	end loop;
	
	-- get array elements
	for I in S'Range loop
		Put(Pop'Image);
	end loop;
	
end Main;
