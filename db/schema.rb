# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2024_09_28_212303) do
  create_table "inbox_items", force: :cascade do |t|
    t.text "body", null: false
    t.integer "user_id", null: false
    t.boolean "done", default: false, null: false
    t.boolean "pinned", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_inbox_items_on_user_id"
  end

  create_table "next_actions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "project_id"
    t.text "body", null: false
    t.boolean "done", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "context"
    t.index ["project_id"], name: "index_next_actions_on_project_id"
    t.index ["user_id"], name: "index_next_actions_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.integer "user_id", null: false
    t.string "area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "waiting_for"
    t.string "incubating_until"
    t.date "stops_incubating_at"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "inbox_items", "users"
  add_foreign_key "next_actions", "projects"
  add_foreign_key "next_actions", "users"
  add_foreign_key "projects", "users"
  add_foreign_key "sessions", "users"
end
