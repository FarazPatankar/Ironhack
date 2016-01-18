class StringCalculator
	def add(string)
		if string == ""
			0
		elsif string.size == 1
			string.to_i
		else
			sum = 0
			split_string = string.gsub(/\W/, ",").split(",")
			split_string.each do |x|
				sum += x.to_i
			end
			sum
		end
	end
end