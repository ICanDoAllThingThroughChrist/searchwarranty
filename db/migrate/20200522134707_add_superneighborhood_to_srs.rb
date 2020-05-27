class AddSuperneighborhoodToSrs < ActiveRecord::Migration[5.2]
  def change
    add_column :srs, :super_neighborhood, :string
  end
end
