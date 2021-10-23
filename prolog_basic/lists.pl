is_a_list([]).
is_a_list(list(Head, Tail)) :-
    is_a_list(Tail).

cons([], X, X).
cons([A|B], C, [A|D]) :-
cons(B,C,D).
