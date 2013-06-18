Guesser := Object clone do (
	init := method(
		self listener := File  standardInput()

		randomNumber := (Random value( 99 ) + 1) floor();

		"Pick a number between 1 and 100" println 
		10 repeat(
			num := self listener readLine() asNumber()

			if(num > randomNumber,
				"too high" println
			) 
			if(num < randomNumber,
				"too low" println
			)
			if(num == randomNumber,
				"got it!" println
				break
			)
		)
	)
)

g := Guesser clone

//guesser listener println