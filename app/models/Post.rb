class Post < ActiveRecord::Base
  has_many :replies
  belongs_to :space
  belongs_to :user
end