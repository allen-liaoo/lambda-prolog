sig setspl.

kind color type.
type red, blue color.

kind pair   type -> type -> type.
type pr     A -> B -> pair A B.

% setSplitting [+O] [+S] [-A] iff [A] is an assignment of colors to each object in [O] s.t. each set in [S] has at least one red/bleu object
type setSplitting  list A -> list (list A) -> list (pair A color) -> o.

end