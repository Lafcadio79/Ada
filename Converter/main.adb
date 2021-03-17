-- -----------------------------------------------------------
-- |                                                          |
-- |               A simple encrypter/decrypter               |
-- |                       (easy busy)        			          |
-- |														                              |
-- -----------------------------------------------------------

-- an example showing how Ada allows accessing procedure types 

with Ada.Text_IO;

procedure Main is
	use Ada.Text_IO;
	
	type Converter is not null access procedure(S: in out String);
	
	procedure Encrypt(Text: in out String) is
	begin
		for I in Text'Range loop
			Text(I) := Character'Succ(Text(I));
		end loop;
	end Encrypt;
	
    procedure Decrypt(Text: in out String) is
	begin
		for I in Text'Range loop
			Text(I) := Character'Pred(Text(I));
		end loop;
	end Decrypt;
	
	procedure Apply(Proc: in Converter; To: in out String) is
	begin
		Proc(To);
	end Apply;

	Sample: String := "Send reinforcements. We're going to advance.";
begin

	-- print "Send reinforcements. We're going to advance."
	Put_Line(Sample);
	
	Apply(Proc => Encrypt'Access, To => Sample);
	
	-- print the encrypted string 
	Put_Line(Sample);	

	Apply(Proc => Decrypt'Access, To => Sample);

	-- print "Send reinforcements. We're going to advance."
	Put_Line(Sample);	

end Main;
