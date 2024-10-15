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

ActiveRecord::Schema[7.2].define(version: 2024_10_15_063804) do
  create_table "contracts", id: :string, force: :cascade do |t|
    t.string "number"
    t.date "date"
    t.text "description"
  end

  create_table "specifications", id: :string, force: :cascade do |t|
    t.string "number"
    t.date "date"
    t.text "description"
    t.string "contract_id", null: false
    t.index ["contract_id"], name: "index_specifications_on_contract_id"
  end

  create_table "users", id: :string, force: :cascade do |t|
    t.string "login"
    t.string "password_digest"
    t.string "name"
    t.string "patronymic"
    t.string "surname"
  end

  add_foreign_key "specifications", "contracts"
end
