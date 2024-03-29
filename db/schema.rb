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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111114054659) do

  create_table "share_urls", :force => true do |t|
    t.integer  "user_id"
    t.integer  "url_id"
    t.string   "s_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sources", :force => true do |t|
    t.string   "url"
    t.string   "title"
    t.string   "image_url"
    t.text     "summary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "urls", :force => true do |t|
    t.string   "origin"
    t.string   "release"
    t.string   "short"
    t.string   "title"
    t.integer  "source_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "uid"
    t.integer  "source_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
