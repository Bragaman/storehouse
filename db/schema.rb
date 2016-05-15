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

ActiveRecord::Schema.define(version: 20160515120009) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string   "entity_name",  null: false
    t.text     "bank_details", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "products", force: :cascade do |t|
    t.float    "width"
    t.float    "height"
    t.float    "length"
    t.float    "weight"
    t.integer  "agreement_number"
    t.float    "temperature_min"
    t.float    "temperature_max"
    t.float    "humidity_min"
    t.float    "humidity_max"
    t.datetime "receipt_date"
    t.datetime "expiration_date"
    t.integer  "client_id"
    t.integer  "stack_id"
    t.integer  "position"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "products", ["client_id"], name: "index_products_on_client_id", using: :btree
  add_index "products", ["stack_id"], name: "index_products_on_stack_id", using: :btree

  create_table "rooms", force: :cascade do |t|
    t.string   "name",            null: false
    t.float    "volume",          null: false
    t.float    "temperature_min", null: false
    t.float    "temperature_max", null: false
    t.float    "wet_min",         null: false
    t.float    "wet_max",         null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "stacks", force: :cascade do |t|
    t.integer  "number",         null: false
    t.integer  "room_id"
    t.integer  "place_count",    null: false
    t.float    "place_height",   null: false
    t.float    "place_width",    null: false
    t.float    "place_length",   null: false
    t.float    "max_total_load", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "stacks", ["room_id"], name: "index_stacks_on_room_id", using: :btree

  add_foreign_key "products", "clients"
  add_foreign_key "products", "stacks"
  add_foreign_key "stacks", "rooms"
end
