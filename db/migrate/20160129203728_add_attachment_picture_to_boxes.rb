class AddAttachmentPictureToBoxes < ActiveRecord::Migration
  def self.up
    change_table :boxes do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :boxes, :picture
  end
end
