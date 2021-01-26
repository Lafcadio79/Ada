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
		
		-- goto statement (just if you like spaghetti :))
		
	
end Main;
