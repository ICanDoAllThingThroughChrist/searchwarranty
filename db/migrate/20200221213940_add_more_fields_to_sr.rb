class AddMoreFieldsToSr < ActiveRecord::Migration[5.1]
  def change
    add_column :srs, :ne_overdue, :integer
    add_column :srs, :ne_not_overdue, :integer
    add_column :srs, :ne_sr_total, :integer
    add_column :srs, :nw_overdue, :integer
    add_column :srs, :nw_not_overdue, :integer
    add_column :srs, :nw_sr_total, :integer
    add_column :srs, :se_overdue, :integer
    add_column :srs, :se_not_overdue, :integer
    add_column :srs, :se_sr_total, :integer
    add_column :srs, :sw_overdue, :integer
    add_column :srs, :sw_not_overdue, :integer
    add_column :srs, :sw_sr_total, :integer
  end
end
