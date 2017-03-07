class User < ActiveRecord::Base
  has_many :ideas, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :ideas_liked, through: :likes, source: :ideas
  
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  
  validates :name, :alias, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: true}, format: {with: EMAIL_REGEX}
  validates :password, length: {minimum: 8}, on: :create
  
end
