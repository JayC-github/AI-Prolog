% Function that sums the squares of only the even numbers in a list of integers.
% example   sumsq_even([1,3,4,2,-4,5,8,-7], Sum).  --> Sum = 120

% Base case: nothing in the list
sumsq_even([], 0).

% Recursive case: sums the square of the even number in a list.
% if the number is even
sumsq_even([Head | Tail], Sum) :-
    sumsq_even(Tail, SumTemp),
    0 is Head mod 2,
    Sum is Head * Head + SumTemp.
% else if the number is not even
sumsq_even([Head | Tail], Sum) :-
    sumsq_even(Tail, SumTemp),
    1 is Head mod 2,
    Sum is 0 + SumTemp.