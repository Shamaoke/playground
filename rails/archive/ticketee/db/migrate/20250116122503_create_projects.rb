
class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects, id: false do |t|

      t.string :id, primary_key: true
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end

