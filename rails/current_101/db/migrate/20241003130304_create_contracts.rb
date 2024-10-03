class CreateContracts < ActiveRecord::Migration[7.2]
  def change
    create_table :contracts do |t|
      t.string :number

      t.timestamps
    end
  end
end
