% xxx
% give a list, get the list between 'you' and 'me'
get_words(List, NewList) :-
    % AfterList store the elements after the element 'you'
    append(_, [you|AfterList], List),
    % BeforeList(NewList) store the elements before the element 'me' 
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
