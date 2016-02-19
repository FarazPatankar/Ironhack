# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

locations = %w(USA Spain Australia China)

%w(John Jane Bob Charlie Jake Albert).each_with_index do |name, index|
  user = User.create(name: name, location: locations[index % locations.size])

  1.upto 3 do |number|
    user.tasks.create(name: "Task #{number} for user: #{user.name}")
  end
end
