module lists.

append nil L L.
append (X::L1) L2 (X::L3) :- append L1 L2 L3.

appendNoDup nil L L.
appendNoDup (X::L1) L2 (X::L3) :- not (member L2 X) , appendNoDup L1 L2 L3. 
appendNoDup (X::L1) L2 (X::L3) :- (member L2 X), select L2 L2' X,   % if X is a member of L2, remove it from L2, then append
    appendNoDup L1 L2' L3. 

member (X::L) X.
member (Y::L) X :- member L X.

rotate_left nil nil.
rotate_left (X::L1) L2 :- append L1 (X::nil) L2.

rotate_right nil nil.
rotate_right L1 (X::L2) :- append L2 (X::nil) L1.

type firstCol list (list A) -> list A -> o.
type allNil list (list A) -> o.
type vertTrim list (list A) -> list (list A) -> o.
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

select (X::L1) L1 X.
select (Y::L1) (Y::L2) X :- select L1 L2 X.

selectK L1 0 nil :- !.  % cut prevents selectK from generating duplicated results using rule 3
selectK (X::L1) K (X::L2) :- K1 is (K - 1) , selectK L1 K1 L2.
selectK (X::L1) K L2 :- selectK L1 K L2.

permute nil nil.
permute L1 (X::L2) :- select L1 L3 X , permute L3 L2.

sublist L nil.
sublist (X::L1) (X::L2) :- sublist L1 L2.
sublist (X::L1) (Y::L2) :- sublist L1 (Y::L2).
% We specify (Y::L2) in the rule to ensure we dont generate duplicate answers (with rule 1 and 3)

% subset_sum v1
/*
    type sublist list A -> list A -> o.
    type sum list int -> int -> o.
    type sumhelp list int -> int -> o.

    sublist L nil.
    sublist (X::L1) (X::L2) :- sublist L1 L2.
    sublist (X::L1) (Y::L2) :- sublist L1 (Y::L2).

    sum L N :- 
        (sumhelp nil K & 
        pi X\ pi L\ pi N\ 
            sumhelp (X::L) N :- sumhelp L (N + X))
        => (sumhelp L 0 & N is K).

    subset_sum L SL N :- sublist L SL , sum SL N.
*/
% subset_sum v2: generate and test
/* 
    type sublist list A -> list A -> o.
    type sum list int -> int -> o.

    sublist L nil.
    sublist (X::L1) (X::L2) :- sublist L1 L2.
    sublist (X::L1) (Y::L2) :- sublist L1 (Y::L2).

    sum nil 0.
    sum (X::L) N :- sum L N1 , N is (N1 + X).

    subset_sum L SL N :- sublist L SL , sum SL N.  % generate SL, then test against N
*/

% subset_sum v3: integrated generate and test
% subset_sum +L1 -L2 +N.  (only L2 is optional)
subset_sum L nil 0.
subset_sum (X::L1) (X::L2) N :- N1 is (N - X) , subset_sum L1 L2 N1.
subset_sum (X::L1) L2 N :- subset_sum L1 L2 N.

evenLength nil.
evenLength (X::Y::L1) :- evenLength L1.
end