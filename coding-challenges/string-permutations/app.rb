def permutations?(str_one, str_two)
	str_one = str_one.downcase
	str_two = str_two.downcase

	#Alphabetize the strings
	str_one = str_one.chars.sort.join
	str_two = str_two.chars.sort.join

	str_one == str_two
end

puts permutations?("presentable", "albrnpeetse")  #=> true
puts permutations?("presentable", "raelsbtpene")  #=> true
puts permutations?("presentable", "taco")         #=> false
puts permutations?("taco", "cato")                #=> true
puts permutations?("taco", "cat")                 #=> false