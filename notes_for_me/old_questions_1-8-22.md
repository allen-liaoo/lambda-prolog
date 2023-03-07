# lambda-prolog

## Questions
- If there are more than one facts about a predicate that is compatiblre with the query, which one is used in the unification?
```
pred (X::L1) (X::L2) :- ... .
pred (X::L) (Y::L2) :- ... .
```
are both facts used with a query like "pred [1,2] [1,3]." to find solutions?
- How is the "is" predicate implemented? I often get the error message "Error: is: Flexible term head in evaluation" with the "is" predicate. I think this has to do with when unification is performed by I'm not sure what exactly the problem is. I was able to fix it by swapping the operands of "is". 
- Regarding the `select` predicate, I have the clause 
```
select (Y::L1) (Y::L2) X :- select L1 L2 X , not (Y is X).
```
I can't figure out why if I switch the order of the clauses after the :-, the predicate won't work correctly. For example, if I write `select [1,2,3] [1,2] X.` it shows no solutions. 
- I'm not sure why if I delete the `member` clause in this statement
```
permute (X::L1) (Y::L2) :- member Y L1 , select (X::L1) L3 Y , permute L3 L2.
```
the predicate permute generates dulicated solutions given a query like `permute [1,2,3] L.` when `select [1,2,3] L3 Y` only generates three solutions (one for each element in [1,2,3]). 
- My `mult` and `exp` predicates work but they seg fault or won't terminate if the queries require more computation. For example, 
```
mult X Y (s (s (s (s (s (s z)))))).  % X*Y=6: seg fault when the only answer left is X = 1 and Y = 6.
exp (s (s (s z))) X (s (s (s (s (s (s (s (s (s z))))))))).  % 2^X=0: seg fault
```
Is there a way to fix this or make the computation faster?
