class CreateGisSwmdLists < ActiveRecord::Migration[5.2]
  def change
    create_table :gis_swmd_lists do |t|
      t.integer :OBJECTID
      t.integer :STREET_NUM
      t.text :FRACTION
      t.text :PREFIX
      t.text :STREET_NAME
      t.text :SUFFIX
      t.text :STREET_TYPE
      t.text :STATE
      t.text :CITY
      t.integer :ZIPCODE
      t.text :GlobalID
      t.text :synthetic

      t.timestamps
    end
  end
end
