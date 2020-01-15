class AddFieldsToSr < ActiveRecord::Migration[5.1]
  def change
    add_column :srs, :field1, :integer
    add_column :srs, :field2, :integer
  end
end
