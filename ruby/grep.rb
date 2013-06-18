z = "bacon"
puts z['b']

filetext = File.readlines('baconipsum.txt')
puts filetext.class
puts "enter in a phrase to search:"
phrase = gets
p2 = Regexp.new phrase.strip
puts p2

filetext.each {|x| 
	if x[p2] != nil
		puts x
	end
}