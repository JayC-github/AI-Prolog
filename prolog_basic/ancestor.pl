female(pam).
female(liz).
female(pat).
female(ann).
male(tom).
male(bob).
male(jim).

parent(pam, bob).
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

mother(Parent, Child) :- parent(Parent, Child), female(Parent).
father(Parent, Child) :- parent(Parent, Child), male(Parent).

grandparent(X, Z) :- parent(X, Y), parent(Y, Z).

sister(Sister, Sibling) :-
    parent(P, Sister),
    parent(P, Sibling),
    female(Sister),
    Sister \= Sibling.

ancestor(X, Y) :-
    parent(X, Y).
ancestor(X, Y) :-
    parent(Z, Y),
    ancestor(X, Z).

% ORRR

$ Base case:
ancestor(X, Y):- parent(X, Y).
ancestor(X, Y) :-
    parent(X, Z),
    ancestor(Z, Y).
