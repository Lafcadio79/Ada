-- -----------------------------------------------------------
-- |                                                          |
-- | A procedure that checks if a string is palindrome or not |
-- |                                                          | 
-- -----------------------------------------------------------

with Ada.Strings.Fixed, Ada.Text_IO, Ada.Integer_Text_IO;

procedure Palindrome is
	use Ada.Strings.Fixed, Ada.Text_IO, Ada.integer_Text_IO;
			
	-- how to define a non arbitrary string length
	Str: String(1 .. 10000);
	Last, Temp, Flag: Integer;
	
begin
	Put("Type a sequence of characters");
	New_Line;
	Put("[empty line to exit]");
	loop
		Flag := 0;
		New_Line;
		Put("> ");
		Get_Line(Str, Last);
		exit when Last = 0; -- loop guard (exit condition)
		New_Line;
		-- how to concatenate a string and integers
		Put("Text: " & Str(1 .. Last));
		New_Line;
		Put("Length: " & Ada.Strings.Fixed.Trim(Integer'Image(Last), Ada.Strings.Left));
		Temp := Last;
		for i in 1 .. Last/2 loop
			if Str(i) /= Str(Temp) then
				Flag := 1;
				exit;
			end if;
			Temp := Temp - 1;
		end loop;
		New_Line;
		if Flag = 0 then
			Put("Palindrome: True");
		else
			Put("Palindrome: False");
		end if;
	end loop;
	
	New_Line;
	Put("Program finished!");
	
end Palindrome;
