class ChangeCaseNumberToNewFromSpatialOverdueHvy < ActiveRecord::Migration[5.2]
  change_table :spatial_overdue_hvies do |table|
    table.change :case_number, :text
  end
end
