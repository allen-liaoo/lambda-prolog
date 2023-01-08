module lists.
%1
append nil L L.
append (X::L1) L2 (X::L3) :- append L1 L2 L3.

rotate_left nil nil.
rotate_left (X::L1) L2 :- append L1 (X::nil) L2.

rotate_right nil nil.
rotate_right L1 (X::L2) :- append L2 (X::nil) L1.

%2
% check if a list is the head of each of M's row
firstCol nil nil.
firstCol [(H1::T1)|M] (H2::T2) :- H1 is H2, firstCol M T2.
% trim the matrix vertically by deleting the first column
vertTrim nil nil.
vertTrim [(H1::T1)|M1] [T1|M2] :- vertTrim M1 M2.

% check if a list is all nils
allNil nil.
allNil (nil::L) :- allNil L.

transpose nil M :- allNil M. % M ends up being the tail of all rows, which is a list of nils
transpose [R1|M1] [R2|M2] :- firstCol [R2|M2] R1 , vertTrim [R2|M2] M3, transpose M1 M3.

%3
select nil nil X.
select (X::L1) L1 X.
select (Y::L1) (Y::L2) X :- select L1 L2 X , not (X is Y).
% if I switch the conjunctive clauses, select wouldnt work if the second list or the number is not provided  
% select2 (Y::L1) (Y::L2) X :- not (X is Y), select L1 L2 X.

%4
member X (X::L).
member X (Y::L) :- member X L.

permute nil nil.
permute (X::L1) (X::L2) :- permute L1 L2.
permute (X::L1) (Y::L2) :- member Y L1 , select (X::L1) L3 Y , permute L3 L2.
% without using "member" in permute, it generates duplicated solutions under the query "permute [1,2,3] L."

%5
subset L nil.
subset (X::L1) (X::L2) :- subset L1 L2.
subset (X::L1) (Y::L2) :- subset L1 (Y::L2).

sumlist L N :- 
    (sumhelp nil K & 
    pi X\ pi L\ pi N\ 
        sumhelp (X::L) N :- sumhelp L (N + X))
    => (sumhelp L 0 & N is K).

subset_sum L SL N :- subset L SL , sumlist SL N.
end