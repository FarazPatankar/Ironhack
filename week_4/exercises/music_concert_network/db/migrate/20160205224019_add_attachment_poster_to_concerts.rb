class AddAttachmentPosterToConcerts < ActiveRecord::Migration
  def self.up
    change_table :concerts do |t|
      t.attachment :poster
    end
  end

  def self.down
    remove_attachment :concerts, :poster
  end
end
