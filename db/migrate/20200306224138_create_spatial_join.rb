class CreateSpatialJoin < ActiveRecord::Migration[5.1]
  def change
    create_table :spatial_joins do |t|
      t.integer :SpatialJoin_id
      t.string :case_number
      t.string :QUAD
    end
  end
end
