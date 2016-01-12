#                 0         1        2           3           4
shoe_brands = [ "Nike", "Reebok", "Puma", "Steve Madden", "Uggs" ]

# shoe_brands.each_with_index do | brand, i |
#   puts "This brand is my No. #{i + 1} favorite: #{brand}"
# end


# favorite = shoe_brands.find do | brand |
#   brand.length == 12
# end

# puts "My REAL favorite brand is: #{favorite}"
# p favorite



# upper_brands = []

# shoe_brands.each do | brand |
#   upper = brand.upcase

#   upper_brands.push(upper)
# end


shortened_brands = shoe_brands.map do | brand |
  brand[0..1]
end

puts shortened_brands

puts '--------------------'

puts shoe_brands


