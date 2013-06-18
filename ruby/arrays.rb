a = (1..16).to_a
xz = []

a.each{|x| 
	xz.push(x)
	if xz.length === 4
		puts xz.join(",")
		xz = []
	end
 }
