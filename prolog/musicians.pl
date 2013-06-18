musician_genre('Yo-Yo Ma',classical).
musician_genre('Jimi Hendrix','rock-n-roll').
musician_genre('Johnny Marr','rock-n-roll').
musician_genre('Warren Zevon','rock-n-roll').
musician_genre('Alvin Lucier',experimental).
musician_genre('Julia Kent',classical).

genre_instrument('rock-n-roll',guitar).
genre_instrument(classical,cello).
genre_instrument(experimental,'pure wave occilator').

musician_instrument(X,Z) :- musician_genre(X,Y), genre_instrument(Y,Z).