# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_03_30_184058) do

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "views"
    t.integer "user_id"
    t.integer "space_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["space_id"], name: "index_posts_on_space_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "replies", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.integer "post_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_replies_on_post_id"
    t.index ["user_id"], name: "index_replies_on_user_id"
  end

  create_table "shields", force: :cascade do |t|
    t.integer "fieldId"
    t.integer "hardwareId"
    t.integer "frameId"
    t.string "color1"
    t.string "color2"
    t.string "color3"
    t.string "color4"
    t.integer "user_id"
    t.index ["user_id"], name: "index_shields_on_user_id"
  end

  create_table "spaces", force: :cascade do |t|
    t.string "space_name"
    t.text "description"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_hash"
    t.boolean "is_mod"
  end

  add_foreign_key "posts", "spaces"
  add_foreign_key "posts", "users"
  add_foreign_key "replies", "posts"
  add_foreign_key "replies", "users"
  add_foreign_key "shields", "users"
end
