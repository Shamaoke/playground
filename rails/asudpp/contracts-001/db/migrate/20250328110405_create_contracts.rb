
class CreateContracts < ActiveRecord::Migration[8.0]
  def change
    create_table :contracts, id: false do |t|
      t.string :id, primary_key: true
      t.string :name
      t.date :date
      t.text :content
    end
  end
end

