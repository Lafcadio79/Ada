-- -----------------------------------------------------------
-- |                                                          |
-- |                Access types & allocators                 |
-- |                                                          |
-- -----------------------------------------------------------

-- Objects of an access type provide access to other objects
-- that can be allocated in a storage pool (the Ada term for a heap)
-- independent of the block structure, thereby making the control
-- of the object allocation more fluid and extending their lifetime 

-- in the following an example of access type for list processing

with Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure Main is
	use Ada.Text_IO;
	use Ada.Integer_Text_IO;
	
	-- the circularity in the definition of Cell_Ptr and Cell is necessary to give an incomplete declaration of Cell
	-- and such incompleteness is useful in the definition of an access type
	type Cell;
	type Cell_Ptr is access Cell;
	type Cell is
		record
			Next:  Cell_Ptr;
			Value: Integer;
		end record;	
	
	-----------------
	-- Declaration --
	-----------------

	-- L1 can be thought as a reference variable which points to an Object of type Cell
	-- the explicit null assignment is redundant since the object takes such a value by default
	-- but it is also necessary otherwise a "Constraint_Error" will be raised at run time  
	L1: Cell_Ptr := null;

	-- the accessed objects are created through an allocator consisting of the reserved word "new"
	-- followed by either the object type or an expression providing the initial value(s) of the object
	L2: Cell_Ptr := new Cell'(null, 66);  -- also new Cell'(Next => L1, Value => 66);
	
	-- Elementary, my dear Watson!
	L3: Cell_Ptr := new Cell'(L2, 77);

	-- another Cell_Ptr
	N: Cell_Ptr;
	
	-- access types can be declared as constants provided they are immediately initialised
	C: constant Cell_Ptr := new Cell'(L3, 55);
		
	-- an access type can also be instantiated with a "not null" clause (e.g., type Cell_Ptr is not null access Cell;) to 
	-- force its declaration with an initial value. By doing so, there will be a check to ensure that the new declared access types
	-- do not have the value null befor an assignment
	-- such strategy is useful to prevent raising Constraint Errors, but it is not very helpful while constructing a list 
	-- because it is necessary to introduce some other technique for identifying its end	
	-- Extra: A null exclusion can also appear in a function result
		
	-- for creating a new record and adding it to the beginning of a list it is possible to use the following statement 
	-- wrapped into a general procedure
	procedure Add_To_List(List: in out Cell_Ptr; V: in Integer) is
		begin
			List := new Cell'(List, V);
		end Add_To_List;

	begin
	
		-- print 66
		Put(L2.Value);

		-- each object compoent can be accessed (as well as assigned) by using the dotted notation
		L2.Value := 0;	

		-- print 0 i.e., the new L2 Value
		Put(L3.Next.Value);
		
		-- init
		N := new Cell'(L3, 33);
		
		-- such assignment statement copies the acces values (i.e., pointers) but not the object!
		L1 := N;
		
		-- print 33
		Put(L1.Value);
		
		-- the object can be copied only component by component or by using all (i.e., L1.all := N.all;)
		L1.Next  := N.Next;
		L1.Value := N.Value;
		
		-- constant access type always refers to the same object but the object value can be changed
		-- print 55
		Put(C.Value);
		
		-- note that the direct assignment is illegal (C := L3; wrong!)
		C.all := L3.all;

		-- print 77
		Put(C.Value);
		
		Add_To_List(L3, 10);
		
		-- print 10
		Put(L3.Value);

end Main;
