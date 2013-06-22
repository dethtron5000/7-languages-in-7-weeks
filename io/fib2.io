fib := Object clone
fib calc := method(
	num,
	self pcalc(num,0,1)
)

fib pcalc := method(
	num,
	A,
	B,
	if(
		num == 0,
		return A,
		self pcalc(
			num - 1,
			B,
			A + B
		)
	)

)

fib calc(30) println