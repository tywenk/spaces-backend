class Shield < ActiveRecord::Base
	belongs_to :user

	# hash must be a string!
	def self.shield_exists?(hash)
		!!User.find_by_hash(hash)
	end

	def self.shields_user(hash)
		User.find_by_hash(hash)
	end

	def self.find_shield_by_user(hash)
		if self.shield_exists?(hash)
			user = Shield.shields_user(hash)
			Shield.find_by(user: user)
		else
			false
		end
	end

	def self.create_shield(hash)
		colors = %w[
			#74cf8c
			#ca74cf
			#fa4353
			#fce24c
			#b9e649
			#f03c13
			#230cf2
			#0cdbf2
			#18ed11
		]

		dec_hash = Integer(hash) #hash.to_i(16) also works
		field_range = dec_hash % 300
		hardware_range = dec_hash % 120
		frame_range = 0
		color1_select = colors[dec_hash % (colors.size) + 1]
		color2_select = colors[dec_hash % (colors.size) + 2]
		color3_select = colors[dec_hash % (colors.size) + 3]
		color4_select = colors[dec_hash % (colors.size) + 4]

		if !self.find_shield_by_user(hash)
			Shield.create(
				fieldId: field_range,
				hardwareId: hardware_range,
				frameId: frame_range,
				color1: color1_select,
				color2: color2_select,
				color3: color3_select,
				color4: color4_select,
				user: self.shields_user(hash),
			)
		end
	end
end
