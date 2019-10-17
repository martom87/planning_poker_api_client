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

ActiveRecord::Schema.define(version: 2019_09_14_191732) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "members", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.string "member_name", default: "", null: false
    t.integer "vote", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_members_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "team_name", default: "", null: false
    t.integer "members_amount", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.string "ticket_name", default: "", null: false
    t.text "ticket_description", default: "", null: false
    t.decimal "average_vote", precision: 3, scale: 2, default: "1.0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "member_id", null: false
    t.index ["member_id"], name: "index_tickets_on_member_id"
    t.index ["team_id"], name: "index_tickets_on_team_id"
  end

  add_foreign_key "members", "teams"
  add_foreign_key "tickets", "members"
  add_foreign_key "tickets", "teams"
end
