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

ActiveRecord::Schema[8.0].define(version: 2025_03_05_070926) do
  create_table "capabilities", id: :string, force: :cascade do |t|
    t.string "name"
  end

  create_table "capabilities_users", id: false, force: :cascade do |t|
    t.string "capability_id"
    t.string "user_id"
    t.index ["capability_id"], name: "index_capabilities_users_on_capability_id"
    t.index ["user_id"], name: "index_capabilities_users_on_user_id"
  end

  create_table "contracts", id: :string, force: :cascade do |t|
    t.string "number"
  end

  create_table "users", id: :string, force: :cascade do |t|
    t.string "name"
    t.string "login"
    t.string "password_digest"
  end

  add_foreign_key "capabilities_users", "capabilities"
  add_foreign_key "capabilities_users", "users"
end
