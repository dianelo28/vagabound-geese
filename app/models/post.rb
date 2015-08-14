class Post < ActiveRecord::Base
	# attr_accessible :all_tags
	belongs_to :user
	belongs_to :city
	has_many :comments, dependent: :destroy
	has_many :taggings, dependent: :destroy
	has_many :tags, through: :taggings

	validates :title, length: { minimum: 1, maximum: 200}
	validates :title, presence: true
	validates :content, presence: true

	extend FriendlyId
	friendly_id :title, use: :slugged

	def all_tags=(names)
		self.tags = names.split(",").map do |name| 
			Tag.where(name: name.strip).first_or_create!

		end
	end

	def all_tags
		self.tags.map(&:name).join(", ")
	end

	def self.tagged_with(name)
	  Tag.find_by_name!(name).posts
	end

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
