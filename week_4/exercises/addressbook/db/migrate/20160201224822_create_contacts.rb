class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.text :name
      t.text :address
      t.text :phone_number
      t.text :email

      t.timestamps null: false
    end
  end
end
