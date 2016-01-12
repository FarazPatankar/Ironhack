total_length = shoe_brands.reduce(0) do | accumulator, brand |
  accumulator + brand.length
end

# Round #1
accumulator = 0, brand = "Nike", return 0 + 4 -> 4

# Round #2
accumulator = 4, brand = "Reebok", return 4 + 6 -> 10

# Round #3
accumulator = 10, brand = "Puma", return 10 + 4 -> 14

# Round #4
accumulator = 14, brand = "Steve Madden", return 14 + 12 -> 26

# Round #5
accumulator = 26, brand = "Uggs", return 26 + 4 -> 30

total_length = 30