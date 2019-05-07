# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_05_07_030842) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "amazon_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "user_cups", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "cup_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "review"
    t.float "value"
    t.index ["cup_id"], name: "index_user_cups_on_cup_id"
    t.index ["user_id"], name: "index_user_cups_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "image_uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "want_cups", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "cup_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cup_id"], name: "index_want_cups_on_cup_id"
    t.index ["user_id"], name: "index_want_cups_on_user_id"
  end

  add_foreign_key "user_cups", "cups"
  add_foreign_key "user_cups", "users"
  add_foreign_key "want_cups", "cups"
  add_foreign_key "want_cups", "users"
end
