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

ActiveRecord::Schema[7.0].define(version: 2022_07_30_114644) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_calls", force: :cascade do |t|
    t.string "api_key", null: false
    t.bigint "game_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_api_calls_on_game_id"
    t.index ["user_id"], name: "index_api_calls_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "game_type_id"
    t.bigint "game_id"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_favorites_on_game_id"
    t.index ["game_type_id"], name: "index_favorites_on_game_type_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer "rating", default: 0
    t.string "title"
    t.text "content"
    t.bigint "user_id", null: false
    t.bigint "game_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_feedbacks_on_game_id"
    t.index ["user_id"], name: "index_feedbacks_on_user_id"
  end

  create_table "game_types", force: :cascade do |t|
    t.string "game_type_title"
    t.text "game_type_descr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.string "game_title"
    t.string "game_url"
    t.text "game_descr"
    t.bigint "game_type_id", null: false
    t.string "image_url", default: "https://iili.io/wGoI3b.png"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "mobile_ready", default: false
    t.index ["game_type_id"], name: "index_games_on_game_type_id"
  end

  create_table "jwt_denylist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "scores", force: :cascade do |t|
    t.integer "score"
    t.bigint "game_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_scores_on_game_id"
    t.index ["user_id"], name: "index_scores_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "nickname", default: "", null: false
    t.string "firstname", default: "", null: false
    t.string "lastname", default: "", null: false
    t.string "gender", default: "", null: false
    t.string "user_key", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "api_calls", "games"
  add_foreign_key "api_calls", "users"
  add_foreign_key "favorites", "game_types"
  add_foreign_key "favorites", "games"
  add_foreign_key "favorites", "users"
  add_foreign_key "feedbacks", "games"
  add_foreign_key "feedbacks", "users"
  add_foreign_key "games", "game_types"
  add_foreign_key "scores", "games"
  add_foreign_key "scores", "users"
end
