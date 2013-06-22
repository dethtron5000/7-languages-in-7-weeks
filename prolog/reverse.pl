
preverse([],[]).
preverse([A],[A]).
preverse([Head|Tail],Reversed) :- preverse(Tail,A), append(A,[Head],Reversed).