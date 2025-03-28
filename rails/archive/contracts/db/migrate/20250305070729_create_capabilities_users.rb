
class CreateCapabilitiesUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :capabilities_users, id: false do |t|
      t.belongs_to :capability, type: :string, foreign_key: true
      t.belongs_to :user, type: :string, foreign_key: true
    end
  end
end

