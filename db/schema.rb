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

ActiveRecord::Schema.define(version: 20151121230103) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_restaurants", force: :cascade do |t|
    t.integer "restaurant_id"
    t.integer "category_id"
  end

  add_index "categories_restaurants", ["category_id"], name: "index_categories_restaurants_on_category_id"
  add_index "categories_restaurants", ["restaurant_id"], name: "index_categories_restaurants_on_restaurant_id"

  create_table "reservations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.integer  "party_size"
    t.datetime "time"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "image_url"
    t.integer  "capacity"
    t.string   "description"
    t.datetime "opening_time"
    t.datetime "closing_time"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
