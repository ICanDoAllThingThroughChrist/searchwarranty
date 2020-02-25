class AddQuadexpressToSrs < ActiveRecord::Migration[5.1]
  def change
    add_column :srs, :quad_status, :string
  end
end
