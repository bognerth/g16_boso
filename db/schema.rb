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

ActiveRecord::Schema.define(:version => 20140124110310) do

  create_table "companies", :force => true do |t|
    t.string   "title"
    t.string   "street"
    t.string   "plz"
    t.string   "city"
    t.string   "phone"
    t.string   "fax"
    t.string   "email"
    t.integer  "department_id"
    t.string   "appellation"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "personal_phone"
    t.string   "personal_fax"
    t.string   "personal_email"
    t.string   "position"
    t.boolean  "interested", :default => false
    t.boolean  "not_interested", :default => false
    t.boolean  "informed", :default => false
    t.boolean  "cooperating", :default => false
    t.boolean  "educates", :default => true
    t.integer  "places"
    t.integer  "azubis"
    t.text     "comment"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "departments", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pages", :force => true do |t|
    t.string   "header"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "admin"
    t.boolean  "edit"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
