class AddAttachmentImageToInstructions < ActiveRecord::Migration
  def self.up
    change_table :instructions do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :instructions, :image
  end
end
