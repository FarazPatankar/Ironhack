class Lexiconomitron
	def eat_t(string)
		string_without_t = string.gsub(/[tT]/, "")
		string_without_t
	end

	def shazam(array)
		reversed_array = array.each do |x|
			x.reverse!
		end
		first_and_last = []
		first_and_last << reversed_array.shift
		first_and_last << reversed_array.pop
		joined_stuff = first_and_last.join(",")
		no_t = eat_t(joined_stuff)
		not_joined = no_t.split(",")
		not_joined
	end

	def oompa_loompa(array)
		array_less_than_4 = []
		array.each do |x|
			if x.size <= 3
				array_less_than_4 << x
			end
		end
		joined_stuff = array_less_than_4.join(",")
		no_t = eat_t(joined_stuff)
		not_joined = no_t.split(",")
		not_joined
	end
end