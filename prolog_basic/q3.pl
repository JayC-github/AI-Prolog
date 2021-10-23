% base case: sort an empty list
isort([], []).
isort([Head|Tail], List) :-
    isort(Tail, TailSorted),
    insert(Head, TailSorted, List).

    