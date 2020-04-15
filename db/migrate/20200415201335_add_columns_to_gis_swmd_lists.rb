class AddColumnsToGisSwmdLists < ActiveRecord::Migration[5.2]
  def change
    add_column :gis_swmd_lists, :created_user, :string
    add_column :gis_swmd_lists, :created_date, :datetime
    add_column :gis_swmd_lists, :last_edited_user, :string
    add_column :gis_swmd_lists, :last_edited_date, :datetime
    add_column :gis_swmd_lists, :SEC_NAME, :string
    add_column :gis_swmd_lists, :COLLECT_DAY, :string
    add_column :gis_swmd_lists, :QUAD, :string
    add_column :gis_swmd_lists, :HELP_SECTION, :string
    add_column :gis_swmd_lists, :RECY_QUAD, :string
    add_column :gis_swmd_lists, :RECY_COLLECT_DAY, :string
    add_column :gis_swmd_lists, :RECY_SEC_NAME, :string
    add_column :gis_swmd_lists, :HVY_TRSH_SEC_NAME, :string
    add_column :gis_swmd_lists, :HVY_TRSH_COLLECT_DAY, :string
    add_column :gis_swmd_lists, :HVY_TRSH_QUAD, :string
    add_column :gis_swmd_lists, :LIFT_COUNT, :integer
    add_column :gis_swmd_lists, :SERV_TYPE, :string
    add_column :gis_swmd_lists, :X_COORD, :float
    add_column :gis_swmd_lists, :Y_COORD, :float
    add_column :gis_swmd_lists, :DESCR, :string
    add_column :gis_swmd_lists, :LAT, :float
    add_column :gis_swmd_lists, :LONG, :float
    add_column :gis_swmd_lists, :Customer_ID, :integer
  end
end
