class AddMinimumBidToProducts < ActiveRecord::Migration
  def change
    add_column :products, :minimum_bid, :decimal
  end
end
