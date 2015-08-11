class User < ActiveRecord::Base
	has_secure_password
	has_many :posts, dependent: :destroy

	# Paperclip
	has_attached_file :profile_image, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :profile_image, :content_type => /\Aimage\/.*\Z/
	validates_with AttachmentSizeValidator, :attributes => :profile_image, :less_than => 1.megabytes
end
