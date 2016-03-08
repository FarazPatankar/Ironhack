def typo?(str_one, str_two)
	if (str_one.length - str_two.length > 1) || (str_two.length - str_one.length > 1)
		false
	else
		str_one = str_one.chars
		str_two = str_two.chars

		counter = 0

		if (str_one.length == str_two.length)
			str_one.each_with_index do |letter, index|
				# p letter
				# p str_two[index]
				if letter == str_two[index]
					counter += 1
				end
			end
			# p counter
			(str_one.length - counter) <= 1
		elsif (str_two.length - str_one.length == 1)
			str_one.each do |letter|
				str_two.each do |char|
					if letter == char
						counter += 1
					end
				end
			end
			(str_one.length - counter) <= 1
		elsif (str_one.length - str_two.length == 1)
			str_two.each do |letter|
				str_two.each do |char|
					if letter == char
						counter += 1
					end
				end
			end
			(str_one.length - counter) <= 1
		end
	end

end

puts typo?("cake", "bake") #=> true
puts typo?("cake", "cakes") #=> true
puts typo?("cake", "cke") #=> true
puts typo?("cake", "ck") #=> false
puts typo?("cake", "casker") #=> false
puts typo?("cake", "base") #=> false
puts typo?("pizza", "puzza") #=> true