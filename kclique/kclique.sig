sig kclique.
% A clique in an undirected graph is a subgraph in which every node is connected to every other node
% A k-clique is a clique with k nodes 
% Here, a graph is represented as a pair of int list and list of pairs of int and int list
% The first int list is a list of nodes, each labeled an integer
% The second list is a list of each node and its neighbors. Each pair in the list
% contains the node's number and a list of neighbors
% The clique 
%    2
%   /|\
%  / | \
% 1-----4
%  \ | /
%   \|/
%    3
% is represented by (pr [1,2,3,4] [(pr 1 [2,3,4]), (pr 2 [1,3,4]), (pr 3 [1,2,4]), (pr 4 [1,2,3])])

kind pair   type -> type -> type.
type pr     A -> B -> pair A B.
% a graph have the type "(pair (list int) (list (pair int (list int))))"

% isclique [+G] [+N] iff N is a list of nodes that constitute a clique in the graph [G] ([G] only contains the list of pairs)
type isclique   (list (pair int (list int))) -> list int -> o.

% kclique [+G] [+K] [-C] iff C is a [K]-clique in [G]
type kclique    (pair (list int) (list (pair int (list int)))) -> int -> list int -> o.
end