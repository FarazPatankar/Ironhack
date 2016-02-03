class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.references  :project, index: true, foreign_key: true
      t.integer  :hours
      t.integer  :minutes
      t.text     :comments
      t.datetime :date
      t.timestamps
    end
  end
end
