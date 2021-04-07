
package Complex_Numbers is

	-- visible part
	type Complex is private;
	I: constant Complex;
	function "+"(X: Complex) return Complex;
	function "-"(X: Complex) return Complex;
	function "+"(X, Y: Complex) return Complex;
	function "-"(X, Y: Complex) return Complex;
	function "*"(X, Y: Complex) return Complex;
	function "/"(X, Y: Complex) return Complex;
	function Cons(R, I: Float) return Complex;
	function Re_Part(X: Complex) return Float;
	function Im_Part(X: Complex) return Float;
	
	-- private part
	private
		-- such a structure can be substituted by an two 
		-- component array without substantial differences
		-- that's just an implementation choice
		type Complex is
			record
				Re, Im: Float;
			end record;
		I: constant Complex := (0.0, 1.0);
	end;