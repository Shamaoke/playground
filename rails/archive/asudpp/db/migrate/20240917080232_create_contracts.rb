class CreateContracts < ActiveRecord::Migration[7.2]
  def change
    create_table :contracts do |t|
      t.string :number
      t.date :date
      t.text :description

      t.timestamps
    end
  end
end
