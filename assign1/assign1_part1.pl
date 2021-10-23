:- set_prolog_flag(answer_write_options,[max_depth(0)]).
% Jian jun (Jay) Chen  z5261536  COMP3411 Assignment1 part1

% Q1.1
% Function that sums the squares of only the even numbers in a list of integers.
% example   sumsq_even([1,3,4,2,-4,5,8,-7], Sum).  --> Sum = 120

% Base case: nothing in the list
sumsq_even([], 0).

% Recursive case: sums the square of the even number in a list.
% if the number is even
sumsq_even([Head | Tail], Sum) :-
    0 is Head mod 2,
    sumsq_even(Tail, SumTemp),
    Sum is Head * Head + SumTemp.
% else if the number is not even
sumsq_even([Head | Tail], Sum) :-
    1 is Head mod 2,
    sumsq_even(Tail, SumTemp),
    Sum is 0 + SumTemp.



% Q1.2
% Function that takes a sentence in the form of a list and replaces any occurence:
% you -> i me->you, my -> your then prepends the list [what, makes, you, say]

% replace the element in a list
% Base case: empty list
replace(_, _, [], []).

replace(Old, New, [Old | Tail], [New | NewTail]) :-
    replace(Old, New, Tail, NewTail).

replace(Old, New, [Head|Tail], [Head|NewTail]) :-
    Head \= Old,
    replace(Old, New, Tail, NewTail).

% Base case: no input
eliza1([], []).

% Normal case:
% first replace all the words "you/me/my" into "i/you/your"
% then append the new list to the list [what, makes, you, say]

eliza1(List, NewList) :-
    List \= [],
    replace(you, i, List, TempL1),
    replace(me, you, TempL1, TempL2),
    replace(my, your, TempL2, ReplaceList),
    append([what,makes,you,say], ReplaceList, NewList).


% Q1.3
% […, you, <some words>, me, …] -> [what, makes, you, think, i, <some words>, you]


% get the words between 'you' and 'me' in a given list
get_words(List, NewList) :-
    % AfterList store the elements after the element 'you'
    append(_, [you|AfterList], List),
    % NewList store the elements before the element 'me' 
    append(NewList, [me|_], AfterList).

% Base case: no input
eliza2([], []).

% Normal case:
% first get the <some words> between 'you' and 'me' from the List
% then insert <some words> into the list [what, makes you say, i, <some words>, you]
eliza2(List, NewList) :-
    List \= [],
    List \= [you, me],
    get_words(List, WordList),
    append([what, makes, you, think, i], WordList, TempL1),
    append(TempL1, [you], NewList).


% Q1.4 arithmetic expressions
% eval(Expr, Val) that will evaluate an expression
% eg. eval(add(1, 2), N). --> N = 3.

% Base case
eval(Number, Number):-
    number(Number).

% Noraml case: operator
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
    Num2 \= 0,
    Num is Num1 / Num2.