module kclique.

% selectK [+L1] [+K] [-L2] holds just in case that [L2] is obtained by selecting [K] memebrs of [L1] (in order)
type selectK    list A -> int -> list A -> o.
selectK L1 0 nil :- !.  % cut prevents selectK from generating duplicated results with rule 3
selectK (X::L1) K (X::L2) :- K1 is (K - 1) , selectK L1 K1 L2.
selectK (X::L1) K L2 :- selectK L1 K L2.

type sublist list A -> list A -> o.
sublist L nil.
sublist (X::L1) (X::L2) :- sublist L1 L2.
sublist (X::L1) (Y::L2) :- sublist L1 (Y::L2).

% isconnected [+G] [+X] [+N] iff [X] is in graph [G] and [X] is connected to every node in [N] ([G] only contains the list of pairs)
type isconnected   (list (pair int (list int))) -> int -> list int -> o.

isconnected ((pr X N')::G) X N :- sublist N' N.
isconnected ((pr Y N')::G) X N :- isconnected G X N.    % search for the element in G that matches X

isclique G nil.
isclique G (X::N) :- isconnected G X N , isclique G N.

kclique (pr L G) K C :- selectK L K C , isclique G C.

end