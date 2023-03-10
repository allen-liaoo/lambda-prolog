sig lists.

type append list A -> list A -> list A -> o.

% appendNoDup [+L1] [L2] [-L3] succeeds when [L3] is [L1] and [L2] appended with elements that appear in
% both [L1] and [L2] removed. (appendNoDup assumes [L1] and [L2] themselves have no duplicated elements)
type appendNoDup list A -> list A -> list A -> o.

type member     list A -> A -> o.

type rotate_left    list A -> list A -> o.
type rotate_right   list A -> list A -> o.

type transpose      list (list A) -> list (list A) -> o.

% select [+L1] [-L2] [-X] iff [L2] is [L1] with the first occurence of [X] removed
type select     list A -> list A -> A -> o.

% selectK [+L1] [+K] [-L2] holds just in case that [L2] is obtained by selecting [K] memebrs of [L1] (in order)
type selectK    list A -> int -> list A -> o.

type permute    list A -> list A -> o.

% sublist +L1 -L2 holds iff each element of L2 appears in L1 in the same order that it apepars in L2 (doesn't need to be consecutive).
type sublist    list A -> list A -> o.

type subset_sum list int -> list int -> int -> o.

type evenLength list A -> o.

% foldLeft [+F] [+I] [+L] [-R] folds the list from the left, using the fold function [F]  on the initial value [I] 
% and each element in [L], and produces the resulting value [R]. 
% The fold function takes the current node's value and the result of folding the left part of the list, and returns a value
type foldLeft (B -> A -> B) -> B -> list A -> B -> o.
type foldRight (A -> B -> B) -> B -> list A -> B -> o.

type forall (A -> o) -> list A -> o.
type exists (A -> o) -> list A -> o.
type filter (A -> o) -> list A -> list A -> o.
type map (A -> B) -> list A -> list B -> o.

end
