class AddAttachmentProfileImageToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.attachment :profile_image
    end
  end

  def self.down
    remove_attachment :posts, :profile_image
  end
end
