% arithmetic expressions
% Base case
% add(a, b) :- a + b.
eval(Number, Number):-
    atomic(Number).

% operator add
eval(add(A, B), Num) :-
    eval(A, Num1),
    eval(B, Num2),
    Num is Num1 + Num2.

eval(sub(A, B), Num) :-
    eval(A, Num1),
    eval(B, Num2),
    Num is Num1 - Num2.

eval(mul(A, B), Num) :-
    eval(A, Num1),
    eval(B, Num2),
    Num is Num1 * Num2.

eval(div(A, B), Num) :-
    eval(A, Num1),
    eval(B, Num2),
    Num is Num1 / Num2.
