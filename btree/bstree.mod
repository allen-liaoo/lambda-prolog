module bstree.

member (node (pr _ V) _ _) V.
member (node _ L R) V :- member L V ; member R V.

% findNode [+B] [+K] [-N] iff [N] is the node with key [K] in [B]
type findNode tree A -> int -> tree A -> o.
findNode (node P L R) K (node P L R).
findNode (node (pr K' _) L R) K N :- 
    ((K < K') , findNode L K N ; 
    (K > K') , findNode R K N).

search BST K V :- findNode BST K (node (pr K V) _ _).

insert empty K V (node (pr K V) empty empty).
insert (node (pr K V') L R) K V (node (pr K V) L R).  % key is present, value is replaced
insert (node (pr K' V') L' R) K V (node (pr K' V') L R) :- (K < K') , insert L' K V L.
insert (node (pr K' V') L R') K V (node (pr K' V') L R) :- (K > K') , insert R' K V R.

% leftMost [+B] [-N] iff [N] is the left most node of [B] (take [B] and keep going left until we meet an tree with an empty left subtree)
type leftMost tree (pair int A) -> tree (pair int A) -> o.
leftMost (node (pr K V) empty R) (node (pr K V) empty R).
leftMost (node _ L R) N :- leftMost L N.

% delete:
% Let the node with key [K] be N. If N has:
% (1) both subtrees empty: replace N with empty
% (2) one subtree empty: replace N with the non-empty subtree
% (3) both subtrees non-empty: replace N with the left most node in the right subtree

% case (1, 2)
delete (node (pr K _) L empty) K L :- !.     % cut prevents duplicate solutions when L = empty and next rule is used
delete (node (pr K _) empty R) K R :- !.     % cut prevents duplicate solutions when R = non-empty and next rule is used
% case (3)
delete (node (pr K _) L R) K (node (pr LK LV) L R') :-    % if the node to be deleted is found
    leftMost R (node (pr LK LV) empty LR) ,     % replace N with left most node of right subtree (LR will be moved up a level)
    delete R LK R'.                             % new right subtree must be the original right subtree with left most node deleted

% if node is not found, try left or right subtree
delete empty K empty.                   % if node to be deleted is not found and tree is exhausted, return the same node
delete (node (pr K' V) L R) K (node (pr K' V) L' R) :- (K < K') , delete L K L'.
delete (node (pr K' V) L R) K (node (pr K' V) L R') :- (K > K') , delete R K R'.

end