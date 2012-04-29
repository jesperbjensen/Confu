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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120425173508) do

  create_table "awards", :force => true do |t|
    t.integer  "user_id"
    t.integer  "badge_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "awards", ["badge_id"], :name => "index_awards_on_badge_id"
  add_index "awards", ["user_id"], :name => "index_awards_on_user_id"

  create_table "badges", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "shakes", :force => true do |t|
    t.integer  "source_user_id"
    t.integer  "dest_user_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "shakes", ["dest_user_id"], :name => "index_shakes_on_dest_user_id"
  add_index "shakes", ["source_user_id"], :name => "index_shakes_on_source_user_id"

  create_table "tokens", :force => true do |t|
    t.string   "code"
    t.integer  "badge_id"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.integer  "number_of_times_allowed"
    t.integer  "minimum_time_between_scans_in_minutes"
  end

  add_index "tokens", ["badge_id"], :name => "index_tokens_on_badge_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
  end

end
