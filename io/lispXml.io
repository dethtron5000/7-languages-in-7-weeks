# START:range
OperatorTable addAssignOperator(":", "atPutNumber")
# END:range
# START:curlyBrackets
curlyBrackets := method(
  r := Map clone
  call message arguments foreach(arg,
       r doMessage(arg)
       )
  r
)
# END:curlyBrackets
# START:atPutNumber
Map atPutNumber := method(
  self atPut(
       call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
       call evalArgAt(1))
)

Builder := Object clone

Builder it := 0

formatFromMap := method(
	m,
	out := " " asMutable
	m foreach(
		key,
		value,
		out := out .. key .. "=\"" .. value .. "\" "
	)
	return out
)

Builder forward := method(


  
  fst := call message arguments first
  tagLabel := call message name
  attributeString := "" asMutable

  if(
  	fst != nil,

  	m := doMessage(fst)
  	if(
  		m type == "Map",
  		//writeln("map: ",m)
  		//writeln(formatFromMap(m))
  		attributeString = attributeString .. formatFromMap(m)
  		realargs := call message arguments
  		realargs removeFirst
  		call message setArguments(realargs)
  	)

  )


  self it repeat( write("\t") )


  writeln("<", tagLabel,attributeString ,">")

  self it = self it + 1

  call message arguments foreach(
	arg, 
	content := self doMessage(arg)

	
	if(
		content type == "Sequence", 
  		self it repeat(write("\t"))
		writeln( content)
	)
  )
  self it = self it - 1
  self it repeat(write("\t"))
  writeln("</", call message name, ">")
)


str := "ul({\"author\":\"person\"},
	li(\"Io\"), 
	li(\"Lua\"), 
	li(\"JavaScript\"))"
Builder doString(str)


