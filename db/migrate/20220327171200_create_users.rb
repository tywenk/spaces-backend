class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :user_hash
      t.string :pfp
      t.boolean :is_mod
    end
  end
end
