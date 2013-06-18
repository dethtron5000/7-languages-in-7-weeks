2d := Object clone;



2d dim := method(
	x, 
	y,
	self lists ::= List clone preallocateToSize(x)
	x repeat(
		lists push(
			List clone preallocateToSize(y) setSize(y)
		)
	)
)

2d set := method(
	x, 
	y,
	value,
	self lists at(x) atPut(y,value)
	
) 

2d get := method(
	x,
	y,
	return lists at(x) at(y)
)

2d transpose := method(
	self transposed := self clone
	sz := self lists at(0) size
	self transposed lists := List clone preallocateToSize(sz)
	sz repeat(
		self transposed lists push(
			List clone preallocateToSize(self lists size) setSize(self lists size)
		)
	)

	self lists foreach(
		outerIndex,
		outerList,
		outerList foreach(
			innerIndex,
			innerList,
				self transposed set(innerIndex,outerIndex,self get(outerIndex,innerIndex))
		)
	)
)

2d toFile := method(
	path,
	file := File clone openForUpdating(path)
	self lists foreach(
		index,
		value,
		file write(value join(" "),"\n")
	)

)

2d println
2d dim(3,4)
2d set(1,1,"meeee!")
2d get(1,1) println
2d set(2,3,"yaaaay!")
2d transpose
2d transposed get(3,2) println
2d println
2d toFile("test")