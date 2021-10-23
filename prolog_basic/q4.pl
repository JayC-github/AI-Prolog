% Base case: empty list
split([], [], []).
% case: one element
split([X], [X], []).
% case: alot elements, first element in the first list, second element in second list
split([A, B|T], [A|R], [B|S]) :-
    split(T, R, S).