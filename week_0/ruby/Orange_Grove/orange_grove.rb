class OrangeTree
  attr_reader :height, :age
  
  def initialize
    @height = 5
    @age = 0
    @orange = 0
  end

  def age
    return @age
  end

  def height
    return @height
  end

  def age!
    @age += 1
    if @age >= 4 && @age <= 9
      @orange += 1
    end
    if @age <= 3
      @height += 5
    end
  end

  def dead?
    if @age == 10
      return true
    end
  end

  def any_oranges?
    @orange > 0
  end

  def pick_an_orange!
    if @orange == 0
      return "NoOrangesError"
    else
      @orange -= 1
      return 1
    end
  end
end

class Orange
  attr_accessor :diameter, :orange
  def initialize
    @diameter = 8
    @orange = 0
  end
end

class AppleTree
  attr_reader :height, :age
  
  def initialize
    @height = 4
    @age = 0
    @apple = 0
  end

  def age
    return @age
  end

  def height
    return @height
  end

  def age!
    @age += 1
    if @age >= 5 && @age <= 11
      @apple += 2
    end
    if @age <= 4
      @height += 4
    end
  end

  def dead?
    if @age == 12
      return true
    end
  end

  def any_apples?
    @apple > 0
  end

  def pick_an_apple!
    if @apple == 0
      return "NoApplesError"
    else
      @apple -= 1
      return 1
    end
  end
end

class Apple
  attr_accessor :diameter, :apple
  def initialize
    @diameter = 8
    @apple = 0
  end
end


tree = OrangeTree.new
orange = Orange.new

tree.age! until tree.any_oranges?

puts "Tree is #{tree.age} years old and #{tree.height} feet tall"
  basket = []

until tree.dead?

  # It places the oranges in the basket
  # IT PLACES THE ORANGES IN THE BASKET
  while tree.any_oranges?
    basket << tree.pick_an_orange!
    # puts basket.class
  end

  avg_diameter = 500# It's up to you to calculate the average diameter for this harvest.

  puts "Year #{tree.age} Report"
  puts "Tree height: #{tree.height} feet"
  puts "Harvest:     #{basket.size} oranges with an average diameter of #{avg_diameter} inches"
  puts ""

  # Age the tree another year
  tree.age!
end

puts "Alas, the tree, she is dead!"