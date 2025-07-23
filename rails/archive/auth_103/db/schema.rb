
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

