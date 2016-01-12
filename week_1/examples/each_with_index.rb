#                 0         1        2           3           4
shoe_brands = [ "Nike", "Reebok", "Puma", "Steve Madden", "Uggs" ]

shoe_brands.each_with_index do | brand, i |
  puts "This brand is my No. #{i + 1} favorite: #{brand}"
end
