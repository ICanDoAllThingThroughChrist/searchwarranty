class CreateSpatialOverdueHvies < ActiveRecord::Migration[5.2]
  def change
    create_table :spatial_overdue_hvies do |t|
      t.integer :ID
      t.float :case_number
      t.float :longitude
      t.float :latitude
      t.string :poly_id
      t.string :service_da

      t.timestamps
    end
  end
end
