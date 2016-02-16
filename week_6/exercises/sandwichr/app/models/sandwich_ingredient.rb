class SandwichIngredient < ActiveRecord::Base
  belongs_to :sandwich
  belongs_to :ingredient
end
