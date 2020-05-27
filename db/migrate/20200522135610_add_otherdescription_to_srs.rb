class AddOtherdescriptionToSrs < ActiveRecord::Migration[5.2]
  def change
    add_column :srs, :other_description, :string
  end
end
