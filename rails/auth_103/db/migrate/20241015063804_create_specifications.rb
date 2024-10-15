
class CreateSpecifications < ActiveRecord::Migration[7.2]
  def change
    create_table :specifications, id: false do |t|
      t.string :id, primary_key: true
      t.string :number
      t.date :date
      t.text :description
      t.references :contract, null: false, foreign_key: true, type: :string
      ##
      ## Details of how to define references to models with non default id type (e. g. :string)
      ##
      ## • [ruby on rails - Model association on foreign key that is not integer - Stack Overflow](https://stackoverflow.com/questions/39081045/model-association-on-foreign-key-that-is-not-integer)
      ## • [ActiveRecord::ConnectionAdapters::Table](https://api.rubyonrails.org/classes/ActiveRecord/ConnectionAdapters/Table.html#method-i-references)
      ## • [ActiveRecord::ConnectionAdapters::SchemaStatements](https://api.rubyonrails.org/classes/ActiveRecord/ConnectionAdapters/SchemaStatements.html#method-i-add_reference)
      ##
    end
  end
end

