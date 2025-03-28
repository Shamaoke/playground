
class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users, id: false do |t|
      t.string :id, primary_key: true
      t.string :name
      t.string :login
      t.string :password_digest
    end
  end
end

