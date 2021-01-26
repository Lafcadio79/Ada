-- -----------------------------------------------------------
-- |                                                          |
-- |                    Control structures                    |
-- |                                                          |
-- -----------------------------------------------------------


with Ada.Text_IO; 

procedure Main is
	use Ada.Text_IO;

	type Order is (Left, Right, Back, On) with Default_Value => On;
	
	Hungry     : Boolean := False;
	Free       : Boolean := True;
	Test_Order : Order;
	I          : Integer := 0;
	I_While    : Integer := 10;
	N_For	   : Integer := 10;
	begin	
		-- if statement 
		if Hungry and Free then
			Put_Line("I need fuel!");
		elsif Hungry and not Free then
			Put_Line("I'll wait!");
		elsif Free and not Hungry then
			Put_Line("I'll probably run!");
		else
			Put_Line("I have to work. So do not disturb, please!");
		
		end if;
	
		-- case statement (allows us to choose one of severl sequences or statements)
		case Test_Order is
			when Left   => Put_Line("Turn Left");
			when Right  => Put_Line("Turn Right");
			when Back   => Put_Line("Turn Back");
			when On     => Put_Line("All Straight");
			when others => Put_Line("None of the above"); -- default statement
		end case;
	
		-- loop statement (standard)	
		loop 
			-- an exit statement is mandatory unless you want an everlasting loop
			if I = 10 then exit; end if;
			Put(I'Image & " ");
			I := I + 1;
		end loop;
		
		New_Line;
		
		-- loop statement (with a special shorthand for the exit statement)
		loop
			exit when I = 20;
			Put(I'Image & " ");
			I := I + 1;
		end loop;
		
		New_Line;
		
		-- while statement (when we want to test a condition at the start of each iteration)
		while I_While > 0 loop
			Put(I_While'Image & " ");
			I_While := I_While - 1;
		end loop;
		
		New_Line;
		
		-- for loop (when we want a circumscribed iteration range in ascending order)
		-- note that the I_For variable must not be declared in advance
		for I_For in 1 .. N_For loop
			Put(I_For'Image & " ");
		end loop;

		New_Line;
		
		-- for loop (when we want a circumscribed iteration range in descending order)
		for O in reverse Order range Left .. On loop
			Put(O'Image & " ");
		end loop;
		
		New_Line;
		
		-- we can also give a name to a nested loop structure in order, for instance, to search a specific value/element/object etc.
		-- and then break the whole loop structure using an exit statement within the of inner loop
		-- the identifier (i.e. "Search" in this case) must be repeated between the corresponding end loop and the semicolon
		-- The conditional form of exit can also refer to a loop by name, so: "exit Search when condition"
		Search:
		for J in 1 .. 5 loop
			for K in 1 .. N_For loop
				if K = 5 and J = 2 then
					Put_Line("Outer loop at" & J'Image & ": element" & K'Image & " found!");
					exit Search;
				end if;
			end loop;
		end loop Search;
		
		
		New_Line;

		-- goto statement (just if you like spaghetti :))
		-- In order to ut us off using gotos and labels the notation for a label is unusual and stands out like a sore thumb.
		-- A label is an identifier enclosed in double angled brackets thus <<This_is_a_label>>, and the goto statement takes
		-- the expected form of the reserved word "goto" followd by the label identifier and semicolon
				
		while N_For > 0 loop
			Put_Line("How many times?" & N_For'Image);
			N_For := N_For - 1;
			if N_For = 4 then
				goto This_is_a_label;
			end if;
		end loop;
		
		<<This_is_a_label>>
		
end Main;
