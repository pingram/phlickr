# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140527203145) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "album_photos", force: true do |t|
    t.integer  "photo_id",   null: false
    t.integer  "album_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "album_photos", ["album_id"], name: "index_album_photos_on_album_id", using: :btree
  add_index "album_photos", ["photo_id"], name: "index_album_photos_on_photo_id", using: :btree

  create_table "albums", force: true do |t|
    t.integer  "user_id",     null: false
    t.string   "name",        null: false
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "albums", ["user_id"], name: "index_albums_on_user_id", using: :btree

  create_table "favorite_photos", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "photo_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "favorite_photos", ["photo_id"], name: "index_favorite_photos_on_photo_id", using: :btree
  add_index "favorite_photos", ["user_id"], name: "index_favorite_photos_on_user_id", using: :btree

  create_table "photos", force: true do |t|
    t.integer  "user_id",           null: false
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.integer  "o_width"
    t.integer  "o_height"
    t.integer  "display_width"
    t.integer  "display_height"
  end

  add_index "photos", ["user_id"], name: "index_photos_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username",         null: false
    t.string   "password_digest",  null: false
    t.string   "session_token",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "fname"
    t.string   "lname"
    t.integer  "profile_photo_id"
  end

  add_index "users", ["session_token"], name: "index_users_on_session_token", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
