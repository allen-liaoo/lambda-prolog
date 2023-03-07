module pl.

% helper function of isTrue that carries expected truth value
type hIsTrue form -> (list (pair form truth)) -> truth -> o.
hIsTrue (p N) ((pr (p N) V)::TA) V.
hIsTrue (p N) ((pr (p M) V1)::TA) V :- hIsTrue (p N) TA V.
hIsTrue (neg P) TA t :- hIsTrue P TA f.
hIsTrue (neg P) TA f :- hIsTrue P TA t.
hIsTrue (P and Q) TA V :- hIsTrue P TA V , hIsTrue Q TA V.
hIsTrue (P or Q) TA V :- hIsTrue P TA V ; hIsTrue Q TA V.

isTrue F TA :- hIsTrue F TA t.

% see lists.sig for below list helper functions
type member (list A) -> A -> o.
member (X::L) X.
member (Y::L) X :- member L X.

type select list A -> list A -> A -> o.
select (X::L1) L1 X.
select (Y::L1) (Y::L2) X :- select L1 L2 X.

type appendNoDup list A -> list A -> list A -> o.
appendNoDup nil L L.
appendNoDup (X::L1) L2 (X::L3) :- not (member L2 X) , appendNoDup L1 L2 L3. 
appendNoDup (X::L1) L2 (X::L3) :- (member L2 X), select L2 L2' X, appendNoDup L1 L2' L3. 

varsOf (p N) ((p N)::[]).
varsOf (neg P) L :- varsOf P L.
varsOf (P and Q) L & varsOf (P or Q) L :- (varsOf P L1) , (varsOf Q L2) , appendNoDup L1 L2 L.

% helpers for isTaut
% isAssignment [+L] [-TA] succeeds just in case that [TA] is a truth assignment for the list of propositional variables [L]
% the order of truth assignments in [TA] must match the order of the appearance of propositional variables in [L]
type isAssignment (list form) -> (list (pair form truth)) -> o.
isAssignment nil nil.
isAssignment (A::L) ((pr A t)::TA) &
isAssignment (A::L) ((pr A f)::TA) :- isAssignment L TA.
    % this generates duplicated truth assignments
    %isAssignment L ((pr P t)::TA) &
    %isAssignment L ((pr P f)::TA) :- member L P ,
    %    select L L1 P , 
    %    isAssignment L1 TA.

type isNotTaut form -> o.
isNotTaut E :- varsOf E L , isAssignment L TA , not (isTrue E TA).

isTaut E :- not (isNotTaut E).

end