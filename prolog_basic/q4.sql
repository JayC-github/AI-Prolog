% Base case: empty list
split([], [], []).
% case: one element
split([X], [X], []).
% case: alot elements
split([A, B|T], [A|R], [B|S]) :-
    split(T, R, S).