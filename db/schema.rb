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

ActiveRecord::Schema.define(version: 20161112034501) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coaches", force: :cascade do |t|
    t.string   "name"
    t.string   "team"
    t.string   "age_group"
    t.string   "state"
    t.string   "email"
    t.string   "phone"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "avatar"
  end

  create_table "days", force: :cascade do |t|
    t.string "day"
  end

  create_table "days_practices", id: false, force: :cascade do |t|
    t.integer "practice_id", null: false
    t.integer "day_id",      null: false
    t.index ["day_id", "practice_id"], name: "index_days_practices_on_day_id_and_practice_id", using: :btree
    t.index ["practice_id", "day_id"], name: "index_days_practices_on_practice_id_and_day_id", using: :btree
  end

  create_table "event_recurrences", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "every"
    t.string   "on"
    t.integer  "coach_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "practices", force: :cascade do |t|
    t.integer  "coach_id"
    t.datetime "date"
    t.string   "duration"
    t.integer  "guest_coach_id"
    t.string   "location"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["coach_id"], name: "index_practices_on_coach_id", using: :btree
  end

  add_foreign_key "practices", "coaches"
end
