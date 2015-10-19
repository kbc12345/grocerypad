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

ActiveRecord::Schema.define(version: 20151019094235) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groceries", force: :cascade do |t|
    t.string   "status"
    t.integer  "month"
    t.integer  "year"
    t.integer  "half"
    t.integer  "updator_id"
    t.datetime "delivered_date"
  end

  create_table "grocery_items", force: :cascade do |t|
    t.string   "product_name"
    t.integer  "product_id"
    t.string   "product_category"
    t.decimal  "product_price"
    t.integer  "quantity"
    t.integer  "creator_id"
    t.integer  "updator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "grocery_id"
  end

  create_table "logs", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content"
    t.integer  "parent_id"
    t.string   "parent_type"
  end

  create_table "product_categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.integer  "product_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updator_id"
    t.string   "status"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "access_token"
    t.string "encrypted_password"
    t.string "auth_token"
  end

end
