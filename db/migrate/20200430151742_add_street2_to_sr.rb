class AddStreet2ToSr < ActiveRecord::Migration[5.2]
  def change
    add_column :srs, :street2, :string
  end
end
