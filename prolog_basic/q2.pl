% insert the list

% base case: empty list
insert(X, [], [X]).

% insert element less than the head, num inserted become first element
insert(X, [Y | R], [X, Y| R]) :- 
    X =< Y.

% otherwise insert it in the tail
insert(X, [Y | R1], [Y | R2]) :-
    insert(X, R1, R2), !.
% STOP backtracking