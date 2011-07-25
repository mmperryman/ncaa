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

ActiveRecord::Schema.define(:version => 20110725132842) do

  create_table "payments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "period_id"
    t.boolean  "paid",       :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "periods", :force => true do |t|
    t.string   "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "picks", :force => true do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.integer  "period_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "records", :force => true do |t|
    t.integer  "team_id"
    t.integer  "period_id"
    t.integer  "wins"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.string   "short_name"
    t.string   "mascot"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "first"
    t.string   "last"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
