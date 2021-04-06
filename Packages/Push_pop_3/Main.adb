------------------------------------
--           PUSH AND POP         --
--   (inside a declare structure) --
------------------------------------


-- using an array (fixed length) and an index variable
-- that points to the current top element, we declare a 
-- procedure to add, and a function to remove, elements
-- in and from the array respectively.  

with Ada.Text_IO;

procedure Main is
		use Ada.Text_IO;

begin

	declare 

		Max: constant := 100;
		S: array(1 .. Max) of Integer;
		Top: Integer range 0 .. Max;

		package Stack is

			procedure Push(X: Integer);
	
			function Pop return Integer;

		end Stack;

		package body Stack is
	
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

		end Stack;
	
	begin
		Top := 0;
			---------------------------
	-- rest of the main body --
	---------------------------
	
	-- fill the array (dot notation) 
	for I in 1 .. 100 loop
		Stack.Push(I);
	end loop;
	
	-- get array elements (dot notation)
	for I in 1 .. 100 loop
		Put(Stack.Pop'Image & " ");
	end loop;

	end;  -- end declare
	
	Put_Line("End!");
	
end Main;
