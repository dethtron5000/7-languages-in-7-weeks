move([Disc],X,_,Y) :-  
    format("Move disk ~w from ~w to ~w\n", [Disc, X, Y]).
move([Bottom|Rest],Start,Swap,Goal) :- 
    move(Rest,Start,Goal,Swap), 
    move([Bottom],Start,_,Goal),
    move(Rest,Swap,Start,Goal).