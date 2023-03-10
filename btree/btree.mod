module btree.

foldTree F I empty I.
foldTree F I (node V L R) (F V X Y) :- 
    foldTree F I L X , 
    foldTree F I R Y .

forall F empty.
forall F (node V L R) :- F V , forall F L , forall F R.

exists F (node V L R) :- F V ; forall F L ; forall F R.

map F T T' :- foldTree (x\l\r\ (node (F x) l r)) empty T T'.

end