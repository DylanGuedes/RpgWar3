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

ActiveRecord::Schema.define(version: 20150129153636) do

  create_table "assignments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

# Could not dump table "battles" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "cosmetic_items", force: :cascade do |t|
    t.integer  "price"
    t.string   "name"
    t.float    "damage"
    t.float    "defense"
    t.string   "restriction"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer  "price"
    t.string   "name"
    t.float    "damage"
    t.float    "defense"
    t.string   "restriction"
    t.integer  "player_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

  create_table "pickable_classes", force: :cascade do |t|
    t.string   "name"
    t.string   "description", default: ""
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "players", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "deaths",     default: 0
    t.integer  "kills",      default: 0
    t.integer  "gold",       default: 100
    t.integer  "exp",        default: 0
    t.float    "hp_max",     default: 100.0
    t.float    "hp_actual",  default: 100.0
    t.float    "damage",     default: 15.0
    t.boolean  "atacable",   default: false
    t.float    "defense",    default: 0.0
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "rpg_class"
    t.integer  "level",      default: 1
    t.integer  "safe_tick",  default: 0
    t.float    "mp_actual",  default: 30.0
    t.float    "mp_max",     default: 30.0
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "login"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
