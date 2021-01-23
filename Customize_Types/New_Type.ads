-- -----------------------------------------------------------
-- |                                                          |
-- |        A package (interface) for the New_Type.adb        |
-- |                                                          |
-- -----------------------------------------------------------

package New_Type is

    type Colour is (Red, Amber, Green);

function Print_Colour (Col: Colour) return Colour;
	
end New_Type;