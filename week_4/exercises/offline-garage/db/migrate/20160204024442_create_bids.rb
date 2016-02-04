class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.text :email
      t.integer :amount

      t.timestamps null: false
    end
  end
end
