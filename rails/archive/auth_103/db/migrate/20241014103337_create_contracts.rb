
class CreateContracts < ActiveRecord::Migration[7.2]
  def change
    create_table :contracts, id: false do |t|
      t.string :id, primary_key: true
      t.string :number
      t.date :date
      t.text :description
    end
  end
end

