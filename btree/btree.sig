sig btree.

% representation of binary trees
kind tree   type -> type.
type empty  tree A.
type node   A -> tree A -> tree A -> tree A.

end