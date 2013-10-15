
% male(+Person)
% Specifies the Person is a male.
%
male(abraham).
male(homer).
male(bartholomew).

% female(+Person)
% Specifies the Person is a female.
%
female(mona).
female(marjorie).
female(lisa).
female(margaret).

% mother(+Parent,+Child)
% Specifies Parent is a mother of Child.
%
mother(mona,homer).
mother(marjorie,bartholomew).  	
mother(marjorie,lisa).  
mother(marjorie,margaret).

% father(+Parent,+Child)
% Specifies Parent is a father of Child.
%
father(abraham,homer).
father(homer,bartholomew).  	
father(homer,lisa).  	
father(homer,margaret).

% sibling(+Person1,+Person2)
% Specifies Person1 is a sibling of Person2
%
sibling(X,Y) :- 
	\+ X=Y,
	mother(M,X),
	mother(M,Y)
sibling(X,Y) :-
	\+ X=Y,
	father(F,X),
	father(F,Y).

% brother(+Person1,+Person2)
% Specifies Person1 is a brother of Person2
%
brother(X,Y) :- 
	mother(M,Y),
	mother(M,X),
	male(X).
brother(X,Y) :-
	father(F,Y),
	father(F,Y),
	male(X).

% grandfather(+Person1,+Person2)
% Specifies Person1 is a grandfather of Person2
%
grandfather(X,Y) :- 
	father(X,mother(M,Y))
grandfather(X,Y) :-
	father(X,father(F,Y)).

% Examples of Queries:
% Who are Bartholomew's gradfather(s):
% 	?- grandfather(X,bartholomew).
% Who are Bartholomew's siblings:
% 	?- sibling(bartholomew,X).



