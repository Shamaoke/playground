
class CreateCapabilities < ActiveRecord::Migration[8.0]
  def change
    create_table :capabilities, id: false do |t|
      t.string :id, primary_key: true
      t.string :name
    end
  end
end

