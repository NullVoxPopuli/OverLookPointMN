# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101226220906) do

  create_table "addresses", :force => true do |t|
    t.string  "number"
    t.string  "street"
    t.string  "city"
    t.string  "state"
    t.string  "zip_code"
    t.integer "user_id"
  end

  create_table "link_pages", :force => true do |t|
    t.string   "name"
    t.string   "content"
    t.boolean  "visible"
    t.boolean  "is_link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sequence"
  end

  create_table "link_pages_menu_bars", :id => false, :force => true do |t|
    t.integer "menu_bar_id"
    t.integer "link_page_id"
    t.integer "order"
  end

  create_table "menu_bars", :force => true do |t|
    t.boolean  "is_horizontal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "service_id"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                              :null => false
    t.string   "email",                              :null => false
    t.string   "crypted_password",                   :null => false
    t.string   "password_salt",                      :null => false
    t.string   "persistence_token",                  :null => false
    t.string   "single_access_token",                :null => false
    t.string   "perishable_token",                   :null => false
    t.integer  "login_count",         :default => 0, :null => false
    t.integer  "failed_login_count",  :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "membership",          :default => 0, :null => false
    t.string   "phone_number"
    t.string   "real_name"
  end

end
