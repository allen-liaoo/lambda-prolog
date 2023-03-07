sig bstree.

% representation of binary trees
kind tree   type -> type.
type empty  tree A.
type node   int -> A -> tree A -> tree A -> tree A.  % A node contains a key, a value (of type A), a left and right subtree

% member [+T] [-E] iff [E] is the value of some node in [T]
type member     tree A -> A -> o.

% search [+T] [+K] [-V] iff [K] is the key of a node with value [V] in [T]
type search     tree A -> int -> A -> o.

% insert [+T1] [+K] [+V] [-T2] is the case when [T2] is [T1] with a node of (node K V empty empty) inserted in the right place
% if there is already a node [K] in the bst, then the value is replaced
type insert     tree A -> int -> A -> tree A -> o.

% delete [+T1] [+K] [-T2] is the case when [T2] is [T1] with the node with key [K] deleted ([T2] is still a bst)
type delete     tree A -> int -> tree A -> o.

end