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

ActiveRecord::Schema.define(:version => 20130711080610) do

  create_table "checks", :force => true do |t|
    t.integer  "essay_id"
    t.integer  "user_id"
    t.integer  "by_id"
    t.string   "by_name"
    t.string   "content"
    t.string   "anchor"
    t.boolean  "is_view"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "sentence_id"
    t.string   "username"
    t.text     "content"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "essays", :force => true do |t|
    t.integer  "user_id"
    t.integer  "topic_id"
    t.string   "username"
    t.text     "summary"
    t.text     "content"
    t.boolean  "is_view"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sentences", :force => true do |t|
    t.integer  "user_id"
    t.integer  "essay_id"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "topics", :force => true do |t|
    t.integer  "user_id"
    t.string   "username"
    t.text     "content"
    t.integer  "count"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end
