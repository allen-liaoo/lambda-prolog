sig lists.

%lists
%1 
type append list A -> list A -> list A -> o.
type rotate_left list A -> list A -> o.
type rotate_right list A -> list A -> o.

%2
type firstCol list (list A) -> list A -> o.
type allNil list (list A) -> o.
type transpose, vertTrim list (list A) -> list (list A) -> o.

%3
type select list A -> list A -> A -> o.

%4
type member A -> list A -> o.
type permute list A -> list A -> o.

%5
type subset list A -> list A -> o.
type sumlist, sumhelp list int -> int -> o.
type subset_sum list int -> list int -> int -> o.
end
