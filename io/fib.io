fib := Object clone
fib calc := method(
	num,
	if(
		num < 2, 
		return num, 
		return fib calc(num - 1) + fib calc(num - 2)
	)
)

fib calc(30) println