class User < ActiveRecord::Base
	has_many :posts
	has_many :spaces, through: :posts
	has_many :replies
	has_one :shield

	def self.find_by_hash(hash)
		self.find_by(user_hash: hash)
	end

	def self.user_exists?(hash)
		!!self.find_by_hash(hash)
	end

	def self.safe_create_new_user(hash)
		if !self.user_exists?(hash)
			self.create(user_hash: hash, is_mod: false)
		else
			return
		end
	end


end
