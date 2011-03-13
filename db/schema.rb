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

ActiveRecord::Schema.define(:version => 20110313155133) do

  create_table "access_keys", :force => true do |t|
    t.integer  "user_id"
    t.date     "expiration"
    t.string   "access_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "addresses", :force => true do |t|
    t.string  "number"
    t.string  "street"
    t.string  "city"
    t.string  "state"
    t.string  "zip_code"
    t.integer "user_id"
  end

  create_table "admin_dictionaries", :force => true do |t|
    t.string    "key"
    t.string    "value"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string    "data_file_name",                                 :null => false
    t.string    "data_content_type"
    t.integer   "data_file_size"
    t.integer   "assetable_id"
    t.string    "assetable_type",    :limit => 30
    t.string    "type",              :limit => 25
    t.string    "guid",              :limit => 10
    t.integer   "locale",                          :default => 0
    t.integer   "user_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "fk_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_assetable_type"
  add_index "ckeditor_assets", ["user_id"], :name => "fk_user"

  create_table "dictionaries", :force => true do |t|
    t.string    "key"
    t.string    "value"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "link_pages", :force => true do |t|
    t.string    "name"
    t.text      "content"
    t.boolean   "visible"
    t.boolean   "is_link"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "sequence"
  end

  create_table "link_pages_menu_bars", :id => false, :force => true do |t|
    t.integer "menu_bar_id"
    t.integer "link_page_id"
    t.integer "order"
  end

  create_table "menu_bars", :force => true do |t|
    t.boolean   "is_horizontal"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "parents_sub_pages", :id => false, :force => true do |t|
    t.integer "parent_id"
    t.integer "sub_page_id"
  end

  create_table "poll_options", :force => true do |t|
    t.integer   "votes"
    t.integer   "poll_id"
    t.integer   "address_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "polls", :force => true do |t|
    t.string    "name"
    t.date      "expiration"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "services", :force => true do |t|
    t.string    "name"
    t.string    "description"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "services_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "service_id"
  end

  create_table "users", :force => true do |t|
    t.string    "login",                                  :null => false
    t.string    "email",                                  :null => false
    t.string    "crypted_password",                       :null => false
    t.string    "password_salt",                          :null => false
    t.string    "persistence_token",                      :null => false
    t.string    "single_access_token",                    :null => false
    t.string    "perishable_token",                       :null => false
    t.integer   "login_count",             :default => 0, :null => false
    t.integer   "failed_login_count",      :default => 0, :null => false
    t.timestamp "last_request_at"
    t.timestamp "current_login_at"
    t.timestamp "last_login_at"
    t.string    "current_login_ip"
    t.string    "last_login_ip"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "membership",              :default => 0, :null => false
    t.string    "phone_number"
    t.string    "real_name"
    t.boolean   "is_not_allowed_to_login"
    t.string    "locked_reason"
    t.boolean   "has_paid"
  end

end
