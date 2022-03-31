class CreateShields < ActiveRecord::Migration[6.1]
	def change
		create_table :shields do |t|
			t.integer :fieldId
			t.integer :hardwareId
			t.integer :frameId
			t.string :color1
			t.string :color2
			t.string :color3
			t.string :color4
			t.references :user, foreign_key: true
		end
	end
end
