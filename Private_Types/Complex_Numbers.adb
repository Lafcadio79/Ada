

package body Complex_Numbers is

	-- full declaration of any deferred constants anf functions

	-- unary "+" and "-"
 	function "+"(X: Complex) return Complex is
	begin
		return X;
	end "+";
	
	function "-"(X: Complex) return Complex is
	begin
		return (-X.Re, -X.Im);
	end "-";

	-- binary "+", "-", "*", "/"
	function "+"(X, Y: Complex) return Complex is
	begin
		return(X.Re + Y.Re, X.Im + Y.Im);
	end "+";

	function "-"(X, Y: Complex) return Complex is
	begin
		return(X.Re - Y.Re, X.Im - Y.Im);
	end "-";

	function "*"(X, Y: Complex) return Complex is
	begin
		return(X.Re * Y.Re, X.Im * Y.Im);
	end "*";

	function "/"(X, Y: Complex) return Complex is
	begin
		return(X.Re / Y.Re, X.Im / Y.Im);
	end "/";

	function Cons(R, I: Float) return Complex is
	begin
		return(R, I);
	end Cons;

	function Re_Part(X: Complex) return Float is
	begin
		return X.Re;
	end Re_Part;
	
	function Im_Part(X: Complex) return Float is
	begin
		return X.Im;
	end Im_Part;
	
end Complex_Numbers;