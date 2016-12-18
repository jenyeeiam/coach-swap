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

ActiveRecord::Schema.define(version: 20161215050223) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_trgm"
  enable_extension "fuzzystrmatch"

  create_table "coaches", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "team"
    t.string   "age_group"
    t.string   "state"
    t.string   "email"
    t.string   "phone"
    t.string   "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_coaches_on_user_id", using: :btree
  end

  create_table "practices", force: :cascade do |t|
    t.integer  "coach_id"
    t.string   "time"
    t.string   "duration"
    t.integer  "guest_coach_id"
    t.string   "street"
    t.string   "city"
    t.string   "zipcode"
    t.datetime "date"
    t.string   "team_name"
    t.string   "age_group"
    t.string   "state"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["coach_id"], name: "index_practices_on_coach_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "coaches", "users"
  add_foreign_key "practices", "coaches"
end
