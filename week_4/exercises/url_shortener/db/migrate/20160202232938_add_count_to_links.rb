class AddCountToLinks < ActiveRecord::Migration
  def change
    add_column :links, :count, :integer
  end
end
