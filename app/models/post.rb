class Post < ActiveRecord::Base

  belongs_to :user
  belongs_to :city

  validates :title, length: { minimum: 1, maximum: 200}
  validates :title, presence: true
  validates :content, presence: true

  extend FriendlyId
  friendly_id :title, use: :slugged

end
