class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :user_likes, through: :likes, source: :users
  
  validates :content, presence: true
  validates :user_id, presence: true, on: :create
end
