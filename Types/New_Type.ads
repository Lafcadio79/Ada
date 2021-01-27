-- -----------------------------------------------------------
-- |                                                          |
-- |        A package (interface) for the New_Type.adb        |
-- |                                                          |
-- -----------------------------------------------------------

    -- a type declaration consists of the reserved word "type", 
    -- the identifier to be associated with the type,
    -- the reserved word "in", and the definition of the type
    -- followed by the terminating semicolon

    -- Note: being Amber an overloading, it can be used as an enumeration literal in both distinct enumeration types but,
    -- we cannot use it as an enumeration literal and the identifier of a variable at the same time because the declaration 
    -- of one would hide the other and they could not be declared in the same declarative part.
    -- There is no upper limit on the number of values in an enumeration type but there must be at least one. An empty enumeration
    -- type is not allowed. 

package New_Type is
	
	-- enumeration types
    	type Month is (Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec);

	type Weekday is (Mon, Tue, Wed, Thu, Fri, Sat, Sun);

	type Colour is (Green, Amber, Red) with Default_Value => Green;

	-- Amber is an example of overloading
	type Stone is (Amber, Beryl, Quartz);
	
	type Wheel_State is (Up, Down);
	
	-- range constraints on enumeration types (or subtypes) have the form of: range lower_bound .. upper_bound
	subtype Day_Number is Integer range 1 .. 31;
	
	subtype Leap_Year is Day_Number range 1 .. 29;
	
	subtype Feb_Day is Day_Number range 1 .. 28;
	
	-- a silly function
	function Random_Month (Mon: Month) return Month;
	
end New_Type;
