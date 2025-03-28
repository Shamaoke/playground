class AddTitleToMovie < ActiveRecord::Migration[7.2]
  def change
    add_column :movies, :title, :string
  end
end
