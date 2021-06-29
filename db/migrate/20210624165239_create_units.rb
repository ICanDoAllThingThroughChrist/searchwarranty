class CreateUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :units do |t|
      t.integer :OBJECTID
      t.string :created_user
      t.datetime :created_date
      t.string :last_edited_user
      t.datetime :last_edited_date
      t.string :SEC_NAME
      t.string :COLLECT_DAY
      t.string :QUAD
      t.integer :HELP_SECTION
      t.string :RECY_QUAD
      t.string :RECY_COLLECT_DAY
      t.string :RECY_SEC_NAME
      t.string :HVY_TRSH_SEC_NAME
      t.string :HVY_TRSH_COLLECT_DAY
      t.string :HVY_TRSH_QUAD
      t.integer :LIFT_COUNT
      t.string :SERV_TYPE
      t.integer :STREET_NUM
      t.string :FRACTION
      t.string :PREFIX
      t.string :STREET_NAME
      t.string :SUFFIX
      t.string :STREET_TYPE
      t.string :STATE
      t.string :CITY
      t.integer :ZIPCODE
      t.bigint :X_COORD
      t.bigint :Y_COORD
      t.string :DESCR
      t.bigint :LAT
      t.bigint :LONG
      t.integer :Customer_ID
      t.string :GlobalID
    end
  end
end
