class City < ActiveRecord::Base

	has_many :posts, dependent: :destroy

	extend FriendlyId
	friendly_id :city_name, use: :slugged

end
