# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_28_171549) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id", null: false
    t.boolean "published", default: false
    t.boolean "completed", default: false
    t.string "access_token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "description"
    t.index ["user_id"], name: "index_boards_on_user_id"
  end

  create_table "captures", force: :cascade do |t|
    t.bigint "flag_id", null: false
    t.bigint "game_state_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["flag_id"], name: "index_captures_on_flag_id"
    t.index ["game_state_id"], name: "index_captures_on_game_state_id"
  end

  create_table "flags", force: :cascade do |t|
    t.string "value_digest"
    t.bigint "flag_id"
    t.bigint "board_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["board_id"], name: "index_flags_on_board_id"
    t.index ["flag_id"], name: "index_flags_on_flag_id"
  end

  create_table "game_states", force: :cascade do |t|
    t.string "teamable_type", null: false
    t.bigint "teamable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "board_id", null: false
    t.index ["board_id"], name: "index_game_states_on_board_id"
    t.index ["teamable_type", "teamable_id"], name: "index_game_states_on_teamable_type_and_teamable_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "team_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_memberships_on_team_id"
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "boards", "users"
  add_foreign_key "captures", "flags"
  add_foreign_key "captures", "game_states"
  add_foreign_key "flags", "boards"
  add_foreign_key "flags", "flags"
  add_foreign_key "game_states", "boards"
  add_foreign_key "memberships", "teams"
  add_foreign_key "memberships", "users"
end
