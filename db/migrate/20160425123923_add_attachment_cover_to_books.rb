class AddAttachmentCoverToBooks < ActiveRecord::Migration
  def self.up
    change_table :books do |t|
      t.attachment :cover
    end
    remove_column :books, :image_url
  end

  def self.down
    add_column :books, :image_url, :string, default: "image.png"
    remove_attachment :books, :cover
  end
end
