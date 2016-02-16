class AddNameAndHandleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :handle, :string
  end
end
