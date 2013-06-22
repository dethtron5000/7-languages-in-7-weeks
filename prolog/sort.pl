qsort([],[]).
qsort([A],[A]).
qsort([Head|Tail],Sorted) :- Head < qsort(Tail,A), append(A,[Head],Sorted).