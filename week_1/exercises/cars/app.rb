require_relative("lib/car.rb")
require_relative("lib/flying_car.rb")
require_relative("lib/invisible_car.rb")

nizars_car = Car.new("white", "Honda", "rum rumm")
joshs_car = Car.new("black", "Toyota", "vroum vroum")
alias_car = Car.new("red", "Ferrari", "brum brum")

karins_car = FlyingCar.new("blue", "Tesla", "swooosh")

farazs_car = InvisibleCar.new("camo", "Ford", "prrrrt")

nizars_car.rev
joshs_car.rev
alias_car.rev

karins_car.fly
farazs_car.rev