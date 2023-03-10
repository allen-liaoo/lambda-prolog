sig btree.

% representation of binary trees
kind tree   type -> type.
type empty  tree A.
type node   A -> tree A -> tree A -> tree A.

% foldTree [+F] [+I] [+T] [-R] folds the tree from the bottom up, using the fold function [F] on the initial value [I] 
% and each element in [T], and produces the resulting value [R]
% The fold function takes the current node's value, the result of folding the left subtree, and the result of folding
% the right subtree, and returns a value
type foldTree   (A -> B -> B -> B) -> B -> tree A -> B -> o.

type forall     (A -> o) -> tree A -> o.
type exists     (A -> o) -> tree A -> o.
type map        (A -> B) -> tree A -> tree B -> o.

end