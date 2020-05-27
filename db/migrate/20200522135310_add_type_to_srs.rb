class AddTypeToSrs < ActiveRecord::Migration[5.2]
  def change
    add_column :srs, :type, :string
  end
end
