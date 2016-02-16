class AddTotalCaloriesToSandwiches < ActiveRecord::Migration
  def change
    add_column :sandwiches, :total_calories, :decimal, default: 0
  end
end
