val xy = List.tabulate(20){
	i => util.Random.alphanumeric.take(
		util.Random.nextInt(i+10)
	).mkString
}

println(xy)

val size = (0 /: xy){ (sum, listVal) => sum + listVal.length }
println(size)

