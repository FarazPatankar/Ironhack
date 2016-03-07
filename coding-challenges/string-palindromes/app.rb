def palindrome?(str_one)
	str_one = str_one.gsub(/\W/, "")
	str_two = str_one.reverse

	str_one == str_two
end

puts palindrome?("a car, a man, a maraca")  #=> true
puts palindrome?("campus motto: bottoms up mac")  #=> true
puts palindrome?("maps, dna, and spam")  #=> true
puts palindrome?("racecar")  #=> true
puts palindrome?("there's no place like home") #=> false
puts palindrome?("i like pizza")  #=> false