origDiv := Number getSlot("/")

Number / := method(
	i,
	if(i != 0, self origDiv(i), 0)
)

 10/0 print