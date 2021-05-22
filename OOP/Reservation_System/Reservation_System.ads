-- -----------------------------------------------------------
-- |                                                          |
-- |               Object Oriented Programming                |
-- |          (an example from the John Barnes' Book)         |
-- |														  |
-- -----------------------------------------------------------


-- The following example illustrates the use of tagged types to build a system made up of a hierarchyof types.

-- There are three categories of travel: Basic, Nice, and Posh
-- The higher the category the more the options

-- There's a root type Reservation in the subsequent example, which contains commont components inherited by the other types.
-- The "with null record" Basic_Reservation inherits the procedure Make from Reservation, while the Nice_Reservation type extends
-- the Reservation one and builds its own Make procedure overriding the previous Reservation's Make one. So does the Posh_Reservation type.
-- Each Make procedure calls its own procedures.
-- The reserved word "overriding" is optional cause its purpose is just to be an indication for the compiler.

package Reservation_System is

	type Position is (Aisle, Window);
	type Meal_Type is (Green, White, Red);
	
	type Reservation is tagged
		record
			Flight_Number: Integer;
			Date_of_Travel: Date;
			Seat_Number: String(1..3) := "  ";
		end record;
		
	procedure Make(R: in out Reservation);
	procedure Select_Seat(R: in out Reservation);

	type Basic_Reservation is new Reservation with null record;
	
	type Nice_Reservation is tagged
		record
			Seat_Sort: Position;
			Food: Meal_Type;
		end record;
		
	-- overriding procedure
	overriding
	procedure Make(NR: in out Nice_Reservation); 
	procedure Order_Meal(NR: in Nice_Reservation);
	
	type Posh_Reservation is new Nice_Reservation with
		record
			Destination: Address;
		end record;
		
	-- overriding procedure
	overriding
	procedure Make(PR: in out Posh_Reservation);
	procedure Arrange_Limo(PR: Posh_Reservation);
	
end Reservation_System;
