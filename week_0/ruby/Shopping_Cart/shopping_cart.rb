class ShoppingCart
    def initialize
        @items = []
    end

    def add_item(item)
        @items.push(item)
    end

    def checkout
        total = 0
        @items.each do |item|
            total += item.price
        end
        puts total
    end
end

class Item
    attr_accessor :name, :price
    def initialize(name, price)
        @name = name
        @price = price
    end
    
    def price
        @price
    end
end

class Fruit < Item
    def price
        require 'date'
        today = Date.today
        if today.saturday? || today.sunday?
            @price = @price - (@price * 0.10)
            @price
        else
            @price
        end
    end
end

class Houseware < Item
    def price
        if @price >= 100
            @price = @price + (@price * 0.05)
            @price
        else
            @price
        end
    end
end

my_cart = ShoppingCart.new
car = Item.new("car", 5)
tv = Houseware.new("tv", 120)
banana = Fruit.new("banana", 8)
my_cart.add_item(car)
my_cart.add_item(banana)
my_cart.add_item(tv)
my_cart.checkout