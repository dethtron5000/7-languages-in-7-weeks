

squareBrackets := method(
	return call message arguments

)

List squareBrackets := method(
	args := call message arguments 
	if(
		args size > 1,
		Exception raise("Invalid index!")
	)
	fst := doMessage(args first)
	fst type println
	fst println
	//doMessage(fst) println
	self println
	if(fst type == "Number",
		return self at(fst)
	)
)

l := [1,2,3,4,"car","horse","battery","correct"]

l[0] println
