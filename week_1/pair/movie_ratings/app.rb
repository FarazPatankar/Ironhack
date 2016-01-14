require_relative("lib/movies.rb")
require_relative("lib/chart.rb")

ghostbusters = Movie.new("Ghostbuster", 5, "1")
die_hard = Movie.new("Die Hard", 7, "2")
the_godfather = Movie.new("The Godfather", 10, "3")
home_alone = Movie.new("Home Alone", 8, "4")
titanic = Movie.new("Titanic", 1, "5")
star_wars = Movie.new("Star Wars", 10, "6")

chart = Chart.new
chart.add_movie(ghostbusters)
chart.add_movie(die_hard)
chart.add_movie(the_godfather)
chart.add_movie(home_alone)
chart.add_movie(titanic)
chart.add_movie(star_wars)

# puts chart.create_chart
# puts "-------------"
# puts chart.create_numbers
# puts "\n"
# chart.display_movies

chart.publish