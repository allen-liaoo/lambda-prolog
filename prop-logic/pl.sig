% module for propositional logic
sig pl.

kind form type.

% constructor for propositional variables
type p int -> form.

% logical operators
type neg        form -> form.
type and, or    form -> form -> form.
prefixr neg 3.
infixl or 2.
infixl and 1.

% truth values
kind truth type.
type t, f truth.

% pairs for truth values assignment
kind pair   type -> type -> type.
type pr     A -> B -> pair A B.

% module functions
% istrue [+E] [+TA] is the case if the truth value of formula [E] under the truth assignment [TA] is true.
% istrue assumes [TA] is well formed: all formulas in the list of pairs must be atomic
type isTrue form -> (list (pair form truth)) -> o.

% varOf [+E] [-L] is the case iff [L] is a list of all and only the propositional variables in E.
type varsOf form -> list form -> o.

% isTaut [+E] iff [E] is a tautology
type isTaut form -> o.
end