-- -----------------------------------------------------------
-- |                                                          |
-- |             The body package with a function             |
-- |                                                          |
-- -----------------------------------------------------------


package body New_Type is


function Print_Colour (Col: Colour) return Colour is
	MyColour : Colour;
	begin
		MyColour := Red;
	return MyColour;
end Print_Colour;

end New_Type;


