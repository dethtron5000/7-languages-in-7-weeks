x = rand(10)

puts "enter a number:"
y = gets.to_i

while y != x
	if y < x 
		puts "too low"
		y = gets.to_i
	else 
		puts "too high"
		y = gets.to_i
	end
end
puts "correct"