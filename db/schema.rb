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

ActiveRecord::Schema.define(version: 2018_08_16_183852) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "song_uri"
    t.string "post_body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tag_connections", force: :cascade do |t|
    t.integer "vibe_id"
    t.integer "tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "password"
    t.string "email"
    t.date "birthday"
    t.string "blog_name"
    t.string "photo_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "banner_url", default: "", null: false
    t.string "bio", default: "", null: false
  end

  create_table "vibe_connections", force: :cascade do |t|
    t.integer "vibe_id"
    t.integer "post_id"
  end

  create_table "vibes", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
