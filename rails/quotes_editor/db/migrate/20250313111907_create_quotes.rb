
class CreateQuotes < ActiveRecord::Migration[8.0]
  def change
    create_table :quotes, id: false do |t|
      t.string :id, primary_key: true
      t.string :name
    end
  end
end

