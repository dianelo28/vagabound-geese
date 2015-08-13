class Post < ActiveRecord::Base

  belongs_to :user
  belongs_to :city
  has_many :comments

  validates :title, length: { minimum: 1, maximum: 200}
  validates :title, presence: true
  validates :content, presence: true

  extend FriendlyId
  friendly_id :title, use: :slugged

# has_attached_file :profile_image,
#                  :styles => { :medium => "150x150>", :thumb => "44x44#" },
#                  :storage => :s3,
#                  :s3_credentials => Proc.new { |a| a.instance.s3_credentials },
#                  :path => "/profile_images/:id/:style/profile_image.:extension",
#                  :default_url => "https://s3.amazonaws.com/vagabond-photo-ga/defaults/default_profile_image.png"

# def s3_credentials
#  {:bucket => ENV['S3_BUCKET'], :access_key_id => ENV['S3_PUBLIC_KEY'], :secret_access_key => ENV['S3_SECRET']}
# end

# validates_attachment :profile_image, :presence => true,
#                      :content_type => { :content_type => ["image/jpeg", "image/jpg", "image/gif", "image/png"] },
#                      :size => { :in => 0..1000.kilobytes }



end
