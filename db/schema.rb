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

ActiveRecord::Schema.define(version: 20150127181633) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "echos", force: :cascade do |t|
    t.integer "user_id"
    t.string  "sent_to_venue"
    t.string  "long_url"
    t.string  "short_url"
    t.boolean "is_draft"
    t.text    "body"
  end

  create_table "users", force: :cascade do |t|
    t.string  "twitter_acct"
    t.string  "facebook_acct"
    t.boolean "twitter_on"
    t.boolean "facebook_on"
    t.integer "facebook_char_floor"
    t.boolean "always_link"
    t.string  "twitter_token"
    t.string  "twitter_token_secret"
    t.integer "twitter_id"
    t.string  "twitter_name"
    t.text    "google_credentials"
    t.string  "chrome_token"
  end

  add_index "users", ["chrome_token"], name: "index_users_on_chrome_token", unique: true, using: :btree

end
