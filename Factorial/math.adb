package body math is

function Factorial(N: Positive) return Positive is

begin
	if N = 1 then
		return 1;
	else
		return N * Factorial(N - 1);
	end if;

end Factorial;

end math;