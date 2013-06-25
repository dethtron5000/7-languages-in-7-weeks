has_kids(yes,10).
has_kids(no,0).
has_kids(_,0).

height(tall,10).
height(short,2).
height(_,0).

add(A,B,C) :- C is A + B.

kids_score(Atom,Score) :- has_kids(Atom,Score).
height_score(Atom,Score) :- height(Atom,Score).


%% person looks like [has_kids]
%score(List,Score) :- kids_score(Head,Score).
scExpand(_,[],[]).
scExpand([],_,[]).
scExpand([FirstPredicate|RestPredicates],[FirstCriteria|RestCriteria],Out) :- call(FirstPredicate,FirstCriteria,X), scExpand(RestPredicates,RestCriteria,Y), append([X],Y,Out).
sc(List,Out) :- scExpand([kids_score,height_score],List,Out).