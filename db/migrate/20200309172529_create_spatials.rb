class CreateSpatials < ActiveRecord::Migration[5.1]
  def change
    create_table :spatials do |t|
      t.integer :spatialjoin_id
      t.string :case_numbe
      t.string :quad
    
      t.timestamps
    end
  end
end
