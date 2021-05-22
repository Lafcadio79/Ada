-- -----------------------------------------------------------
-- |                                                          |
-- |               Object Oriented Programming                |
-- |          (an example from the John Barnes' Book)         |
-- |														  |
-- -----------------------------------------------------------


-- The following example illustrates the use of tagged types to build a system made up of a hierarchyof types.

-- In the following the body package contains just the relevant code for types and delegates of the Reservation_System's interface

package body Reservation_System is
	
	procedure Make(R: in out Reservation) is
	
	begin
		Select_Seat(R);
	end Make;
	
	procedure Make(NR: in out Nice_Reservation) is
	
	begin
		Make(Reservation(NR));
		Order_Meal(NR);
	end Make;
	
	procedure Make(PR: in out Posh_Reervation) is
	
	begin
		Make(Nice_Reservation(PR));
		Arrange_Limo(PR);
	end Make;

	procedure Select_Seat(R: in out Reservation) is separate;
	procedure Order_Meal(NR: in Nice_Reservation) is separate;
	procedure Arrange_Limo(PR: in Posh_Reservation) is separate;
	
end Reservation_System;