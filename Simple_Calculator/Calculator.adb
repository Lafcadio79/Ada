-- in order to extend the result you should reference the type to return with an extended version of such type
-- TODO

package body Calculator is

	function sum (a : Integer; b : Integer) return Integer is

	begin
	
		return (a + b);
		
	end sum;

	function sub (a : Integer; b : Integer) return Integer is
	
	begin
	
			return (a - b);
			
	end sub;
	
	function mul (a : Integer; b : Integer) return Integer is
	begin
	
			return (a * b);
			
	end mul;

	function pow (a : Integer; b : Integer) return Float is
	begin
	
			return (Float(a ** b));
			
	end pow;
	
	function div (a : Integer; b : Integer) return Float is
	begin
	
			return (Float(a / b));
			
	end div;

		
end Calculator;