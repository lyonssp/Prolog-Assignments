%%% Implement Quicksort %%%

%qsort(+Ls,-SortedLs)
%Sorts list of integers Ls and returns the answer in SortedLs
%DETERMINISTIC VERSION
qsort([],[]).
qsort([X|Xs],Ys) :-
	partition(Xs,X,Left,Right),
	qsort(Left, SortedLeft),
	qsort(Right, SortedRight),
	append(SortedLeft,[X|SortedRight,Ys).

%partition(+Ls,+Item,-Less,-Greater)
%partitions the list ls around the pivot Item and returns
%elements that are less or equal to Item in Less
%and elements that are greater than Item in Greater
partition([],Item,[],[])
partition([A|As],Item,[A|Less],Greater) :- A =< Item, partition(As,Item,Less,Greater).
partition([A|As],Item,Less,[A|Greater]):- A > Item, partition(As,Item,Less,Greater).
	

%random_qsort(+Ls, -SortedLs)
%Sorts list of integers Ls with a random pivot and returns the answer in SortedLs
%RANDOMIZED VERSION
random_qsort([],[]).
random_qsort(Xs,Ys):-
	length(Xs,N), %N = length of Xs
	Index is random(N),
	list-ref(Xs,Index,Pivot),
	delete_ref(Xs,Index,RestXs),
	partition(RestXs,Pivot,Less,Greater),
	random_qsort(Less,SortedLess),
	random_qsort(Greater,SortedGreater),
	append(SortedLess,[Pivot|SortedGreater],Ys).

%list-ref(+Ls,+Index,-Item)
%returns Item at position Index in Ls
list-ref([Item|Ls],0,Item).
list-ref([L|Ls],N,Item) :-
	N>0,
	N1 is N-1,
	list-ref(Ls,N1,Item).

%delete-ref(+Ls,+Index,-NewList)
%returns NewList, which is Ls with the element at the Index position deleted
delete-ref([Item|Ls],0,Ls).
delete-ref([Item|Ls],N,[Item|NewList]) :-
	N > 0,
	N1 is N-1,
	delete-ref(Ls,N1,NewList).

