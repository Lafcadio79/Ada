-- -----------------------------------------------------------
-- |                                                          |
-- |        A package (interface) for the New_Type.adb        |
-- |                                                          |
-- -----------------------------------------------------------

package New_Type is
	
    -- a type declaration consists of the reserved word "type", 
    -- the identifier to be associated with the type,
    -- the reserved word "in", and the definition of the type
    -- followed by the terminating semicolon
    type Colour is (Red, Amber, Green);

function Print_Colour (Col: Colour) return Colour;
	
end New_Type;
