class User < ActiveRecord::Base
  has_many :posts
  has_many :spaces, through: :posts
  has_many :replies
end