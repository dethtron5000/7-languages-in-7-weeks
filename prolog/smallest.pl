smallest([],A,A).
% Min == minimum found so far
smallest([Head|Tail],Min,Smallest) :- Min < Head, smallest(Tail,Min,Smallest).
smallest([Head|Tail],Min,Smallest) :- Min >= Head, smallest(Tail,Head,Smallest).


smallest([Head|Tail],Smallest) :- smallest(Tail,Head,Smallest).