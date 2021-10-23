% Program:  family.pl
% Source:   Prolog
%
% Purpose:  This is the sample program for the Prolog Lab in COMP9414/9814/3411.
%           It is a simple Prolog program to demonstrate how prolog works.
%           See lab.html for a full description.
%
% History:  Original code by Barry Drake


% parent(Parent, Child)
%
parent(albert, jim).
parent(albert, peter).
parent(jim, brian).
parent(john, darren).
parent(peter, lee).
parent(peter, sandra).
parent(peter, james).
parent(peter, kate).
parent(peter, kyle).
parent(brian, jenny).
parent(irene, jim).
parent(irene, peter).
parent(pat, brian).
parent(pat, darren).
parent(amanda, jenny).


% female(Person)
%
female(irene).
female(pat).
female(lee).
female(sandra).
female(jenny).
female(amanda).
female(kate).

% male(Person)
%
male(albert).
male(jim).
male(peter).
male(brian).
male(john).
male(darren).
male(james).
male(kyle).


% yearOfBirth(Person, Year).
%
yearOfBirth(irene, 1923).
yearOfBirth(pat, 1954).
yearOfBirth(lee, 1970).
yearOfBirth(sandra, 1973).
yearOfBirth(jenny, 2004).
yearOfBirth(amanda, 1979).
yearOfBirth(albert, 1926).
yearOfBirth(jim, 1949).
yearOfBirth(peter, 1945).
yearOfBirth(brian, 1974).
yearOfBirth(john, 1955).
yearOfBirth(darren, 1976).
yearOfBirth(james, 1969).
yearOfBirth(kate, 1975).
yearOfBirth(kyle, 1976).

grandparent(Grandparent, Grandchild) :-
    parent(Grandparent, Child),
    parent(Child, Grandchild).

% older(Person1, Person2) :- Person1 is older than Person2

older(Person1, Person2) :-
    yearOfBirth(Person1, Year1),
    yearOfBirth(Person2, Year2),
    Year2 > Year1.

% challenge siblings

siblings(Person1, Person2) :-
    parent(Parent, Person1),
    parent(Parent, Person2),
    Person1 \= Person2.

% challenge older brother
% check whether person1 is an older brother of person2?
olderBrother(Person1, Person2) :-
    siblings(Person1, Person2),
    male(Person1),
    older(Person1, Person2).

% listCount
listCount([], 0).
listCount([_ | B], Total) :-
    listCount(B, B_Total),
    Total is 1 + B_Total.

% find all the descendants of a person

% base_case
descendant(Person, Descendant) :-
    parent(Person, Descendant).
descendant(Person, Descendant) :-
    parent(Person, Child),
    descendant(Child, Descendant).


% find all the ancestors of a person

ancestor(Person, Ancestor) :-
    parent(Ancestor, Person).
ancestor(Person, Ancestor) :-
    parent(Ancestor, Parent),
    ancestor(Person, Parent).