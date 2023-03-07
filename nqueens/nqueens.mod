module nqueens.
% List helper functions (see lists.sig)
type select list A -> list A -> A -> o.
select (X::L1) L1 X.
select (Y::L1) (Y::L2) X :- select L1 L2 X.
type permute list A -> list A -> o.
permute nil nil.
permute L1 (X::L2) :- select L1 L3 X , permute L3 L2.

/*
    intlist +N -L holds whenever L is a list of N integers, in order, from N to 1.
    This is used to generate a list in nqueens.
*/
type intlist int -> list int -> o.
intlist 0 nil.
intlist N (N::L) :- K is (N - 1) , intlist K L.

/*
    nqtestdown/up +L +N holds whenever the queen at the head of the solution list L does not intersect diagonally
    with the queens at the rest of L.
    nqtest +L holds if of the solution list L if any queens in L does not intersect diagonally with any other queens in L.
*/
type nqtestdown, nqtestup list int -> int -> o. % diagonal: down or up and to the right, 
nqtestdown nil N.
nqtestdown (X::L) N :- not (X = N) , M is (N + 1) , nqtestdown L M.
nqtestup nil N.
nqtestup (X::L) N :- not (X = N) , M is (N - 1) , nqtestup L M.

type nqtest list int -> o.
nqtest nil.
nqtest (X::L) :- Y is (X + 1) , nqtestdown L Y , 
    Z is (X - 1) , nqtestup L Z ,
    nqtest L.

nqueens N L :- intlist N L1 , permute L1 L , % generate
    nqtest L. % test
end