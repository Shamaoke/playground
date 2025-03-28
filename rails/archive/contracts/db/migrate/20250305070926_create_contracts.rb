
class CreateContracts < ActiveRecord::Migration[8.0]
  def change
    create_table :contracts, id: false do |t|
      t.string :id, primary_key: true
      t.string :number
    end
  end
end

