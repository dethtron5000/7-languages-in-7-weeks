Object isNotNumber := method(
	if (
		self type == "Number", 
		return false, 
		return true
	)
)

List myAverage := method(
	if(self select(isNotNumber) size > 0,
		Exception raise("Error!")
	)
	return (self sum)/(self size)

)

a := list(1,2,3,4)
//a sum println
a myAverage println
//a type println
//a isNotNumber println