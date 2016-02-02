class AddStatusToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :status, :boolean
  end
end
