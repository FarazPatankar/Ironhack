class CreateBarbecues < ActiveRecord::Migration
  def change
    create_table :barbecues do |t|
      t.datetime :date
      t.string :title
      t.string :venue

      t.timestamps null: false
    end
  end
end
