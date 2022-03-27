class CreateSpaces < ActiveRecord::Migration[6.1]
  def change
    create_table :spaces do |t|
      t.string :space_name
      t.text :description
    end
  end
end
