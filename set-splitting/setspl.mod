module setspl.

% assign [+L] [-A] iff [A] is an assignment of a color to each object in [L] while perserving the order
type assign         list A -> list (pair A color) -> o.
assign nil nil.
assign (X::L) ((pr X red)::A) &
assign (X::L) ((pr X blue)::A) :- assign L A.

type member list A -> A -> o.
member (X::L) X.
member (_::L) X :- member L X.

% getAssign [+A] [-X] [-C] holds if object [X] has the color [C] in the assignment [A]
type getAssign list (pair A color) -> A -> color -> o.
getAssign ((pr X C)::_) X C.
getAssign (_::A) X C :- getAssign A X C.

% isGood [+A] [+S] holds when [A] is an assignment of color to objects, and each set in [S] has at least one red/blue object
type isGood        list (pair A color) -> list (list A) -> o.
isGood A nil.
isGood A (S::L) :- 
    member S X , member S Y , 
    getAssign A X red , getAssign A Y blue ,
    isGood A L.

setSplitting O S A :- assign O A , isGood A S.

end