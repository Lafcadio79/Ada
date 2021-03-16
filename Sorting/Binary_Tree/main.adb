-- -------------------------------------------------------------
-- |                                                            |
-- |                  Sorting by binary tree                    |
-- |       (partly inspired by John Barnes' Ada user guide)     |
-- |                                                            |
-- -------------------------------------------------------------
with Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure Main is
	use Ada.Text_IO;
	use Ada.Integer_Text_IO;
	
	
	-- a binary tree can be represented by nodes each of which has a values plus pointers to two subnodes
	type Node;
	type Node_Ptr is access Node;
	type Node is
		record
			Left, Right: Node_Ptr;
			Value: Float;
		end record;
	
	type Vector is array(Integer range <>) of Float;
	
	V1 : Vector := (32.0,345.0,534.0,543.0,54.35,4.3,5.7);
	
	-- such procedure sorts the values in an array into ascending order
	procedure Sort(A: in out Vector) is
		Index: Integer;
		Tree: Node_Ptr := null;
		
		-- this is a recursive procedure which adds a new node of value V to the tree
		-- note that the values in the left subtree are lower tan the values in the right one
		procedure Insert(T: in out Node_Ptr; V: in Float) is
		begin
			if T = null then
				T := new Node'(null, null, V);
			elsif V < T.Value then
				Insert(T.Left, V);
			else
				Insert(T.Right, V);
			end if;
		end Insert;
		
		-- this is another recursive procedure for copying the tree values into an array by first 
		-- outputting the left subtree, and then  the right one
		procedure Output(T: in Node_Ptr) is
		begin
			if T /= null then
				Output(T.Left);
				A(Index) := T.Value;
				Index := Index + 1;
				Output(T.Right);
			end if;
		end Output;
	
	begin			-- body of Sort
		for I in A'Range loop
			Insert(Tree, A(I));
		end loop;
		Index := A'First;
		Output(Tree);
	
	end Sort;

begin

	New_Line;
	
	-- print vector values as they are
	for I in V1'Range loop
		Put(V1(I)'Image & " ");
	end loop;
	
	New_Line;
	
	Sort(V1);

	-- print sorted vector values
	for I in V1'Range loop
		Put(V1(I)'Image & " ");
	end loop;
	
	New_Line(2);
	
	Put(" Bye Watson!");
	
end Main;

