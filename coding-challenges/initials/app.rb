def initials(name)
	array_of_names = name.split(" ")
	last_name = array_of_names.pop
	initials = ""
	array_of_names.each do |name|
		name.capitalize!
		initials << name[0] + "."
	end
	initials << last_name.to_s.capitalize

	initials
end

puts initials('code wars') #=> returns C.Wars
puts initials('Barack Hussain obama') #=> returns B.H.Obama