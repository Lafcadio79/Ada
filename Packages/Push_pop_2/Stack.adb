-- body

package body Stack is

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
	-- initialisation
	Top := 0;	

end Stack;