% Function that takes a sentence in the form of a list and replaces any occurence:
% you -> i me->you, my -> your then prepends the list
:- set_prolog_flag(answer_write_options,[max_depth(0)]).

% replace the element in a list
% base case: empty list
replace(_, _, [], []).

% replace the Head if head is the word u want to replace
replace(Old, New, [Old | Tail], [New | NewTail]) :-
    replace(Old, New, Tail, NewTail).

% head is not, keep going
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


