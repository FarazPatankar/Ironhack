require_relative("lib/car.rb")

nizars_car = Car.new("white", "Honda", "rum rumm")
joshs_car = Car.new("black", "Toyota", "vroum vroum")
alias_car = Car.new("red", "ferrari", "brum brum")

nizars_car.rev
joshs_car.rev
alias_car.rev