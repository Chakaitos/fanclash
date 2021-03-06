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

ActiveRecord::Schema.define(version: 20140522165813) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "draft_picks", force: true do |t|
    t.integer  "user_id"
    t.integer  "drafted_player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "drafted_players", force: true do |t|
    t.integer  "game_id"
    t.integer  "player_id"
    t.boolean  "selected",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "game_points"
    t.integer  "tier"
    t.string   "player_url"
    t.integer  "points",        default: 0
    t.integer  "rebounds",      default: 0
    t.integer  "assists",       default: 0
    t.integer  "blocks",        default: 0
    t.integer  "steals",        default: 0
    t.integer  "turnovers",     default: 0
    t.integer  "fantasypoints", default: 0
  end

  create_table "games", force: true do |t|
    t.string   "sport"
    t.datetime "start_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "prizes",          precision: 8, scale: 2
    t.decimal  "buy_in",          precision: 8, scale: 2
    t.integer  "current_entries",                         default: 0
    t.integer  "allowed_entries"
  end

  create_table "participating_users", force: true do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tiebreaker", default: 0
    t.boolean  "paid_out",   default: false
  end

  create_table "players", force: true do |t|
    t.string   "player_name"
    t.string   "player_number"
    t.string   "average_fpoints"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "team"
    t.string   "position"
    t.integer  "age"
    t.string   "height"
    t.string   "weight"
    t.string   "picture"
  end

  create_table "users", force: true do |t|
    t.string   "email",                                          default: "",    null: false
    t.string   "encrypted_password",                             default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                  default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",                                       default: "",    null: false
    t.string   "first_name",                                     default: "",    null: false
    t.string   "last_name",                                      default: "",    null: false
    t.boolean  "admin",                                          default: false
    t.decimal  "money",                  precision: 8, scale: 2, default: 0.0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "winners", force: true do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
