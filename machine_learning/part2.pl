:- op(300, xfx, <-).

% Q2.1
intra_construction(C1 <- B1, C1 <- B2, C1 <- Z1B, C <- Z2B, C <- Z3B) :-
intersection(B1, B2, B),
gensym(z, C),
subtract(B1, B, Z2B),
subtract(B2, B, Z3B),
append(B, [C], Z1B).

% Q2.2
% case: if y is subset of x  eg. x <- [a, b, c, d, e], y <- [a, b, c]
absorption(C1 <- B1, C2 <- B2, C1 <- Z1B, C2 <- B2) :-
subset(B2, B1),
subtract(B1, B2, B3),
append([C2], B3, Z1B).


% Q 2.3
% case: if there is only one symbol left in the second clause
identification(C1 <- B1, C1 <- B2, C1 <- Z1B, C2 <- Z2B) :-
intersection(B1, B2, B),
subtract(B1, B, Z2B),
% if there is only one symbol left for list B2-B
subtract(B2, B, [C2|[]]),
% append
append(B, [C2], Z1B).

% Q 2.4
dichotomisation(C1 <- B1, not(C1) <- B2, C1 <- Z1B, not(C1) <- Z2B, C <- Z3B, not(C) <- Z4B) :-
intersection(B1, B2, B),
gensym(z, C),
append(B, [C], Z1B),
append(B, [not(C)], Z2B),
subtract(B1, B, Z3B),
subtract(B2, B, Z4B).


% Q 2.5
truncation(C1 <- B1, C1 <- B2, C1 <- B3) :-
intersection(B1, B2, B3).

