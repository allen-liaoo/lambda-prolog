module natnos.

plus z X X.
plus (s X) Y (s Z) :- plus X Y Z.

mult X z z.
mult X (s Y) Z :- mult X Y Z1 , plus Z1 X Z.
% seg fault when computing more solutions to X*Y=6?
% cannot computer Y = 6 and X = 1

exp X z (s z).
exp X (s Y) Z :- exp X Y Z1 , mult Z1 X Z.
%seq fault when computing more solutions to 3^X=9 (after computing X=2)
end