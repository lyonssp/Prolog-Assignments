% is_list(+As)
% checks if As is a list
% %
is_list([]).
is_list([A|As]) :-
	is_list([As]).

% my_length(+As, -Len)
% returns the length of list As in Len.
%
my_length([],0)
my_length([A|As],Answer) :-
	my_length([As],N),
	Answer is N+1.

%my_append(+As,+Bs,-Cs)
%appends the lists As and Bs and returns the result in List Cs
%
my_append([],Bs,Bs).
my_append([A|As],Bs,[A|Cs]) :-
	my_append(As,Bs,Cs).

%my_reverse(+As,-Bs)
%reverses list As and returns the result in Bs
%
my_reverse([],[])
my_reverse([A|As],Bs) :-
	my_reverse(As,Xs),
	my_append(Xs,[A],Bs).
	
