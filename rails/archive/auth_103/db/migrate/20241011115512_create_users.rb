
class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users, id: false do |t|
      t.string :id, primary_key: true
      t.string :login
      t.string :password_digest
      t.string :name
      t.string :patronymic
      t.string :surname
      t.string :position
    end
  end
end

