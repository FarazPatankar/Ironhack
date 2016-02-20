class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.references :barbecue, index: true

      t.timestamps null: false
    end
    add_foreign_key :items, :barbecues
  end
end
