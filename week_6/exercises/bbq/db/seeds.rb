# Seed Barbecues
10.times do
  title = [ "#{Faker::Team.name} victory BBQ", "#{Faker::Name.name} Birthday BBQ" ].sample
  venue = [ Faker::Address.city, Faker::Company.name ].sample

  puts "Creating #{title} at #{venue}"
  Barbecue.create(date: Faker::Date.forward(23), title: title, venue: venue)
end
