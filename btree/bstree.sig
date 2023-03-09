sig bstree.
accum_sig btree.

kind pair   type -> type -> type.
type pr     A -> B -> pair A B.

% member [+T] [-E] iff [E] is the value of some node in [T]
type member     tree (pair int A) -> A -> o.

% search [+T] [+K] [-V] iff [K] is the key of a node with value [V] in [T]
type search     tree (pair int A) -> int -> A -> o.

% insert [+T1] [+K] [+V] [-T2] is the case when [T2] is [T1] with a node of (node K V empty empty) inserted in the right place
% if there is already a node with key [K] in the bst, then the value is replaced
type insert     tree (pair int A) -> int -> A -> tree (pair int A) -> o.

% delete [+T1] [+K] [-T2] is the case when [T2] is [T1] with the node with key [K] deleted ([T2] is still a bst)
type delete     tree (pair int A) -> int -> tree (pair int A) -> o.

end