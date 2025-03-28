class CreateSpecifications < ActiveRecord::Migration[7.2]
  def change
    create_table :specifications do |t|
      t.string :number
      t.string :date
      t.string :description
      t.belongs_to :contract, null: false, foreign_key: true

      t.timestamps
    end
  end
end
