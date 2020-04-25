class AddMonthYrToSr < ActiveRecord::Migration[5.2]
  def change
    add_column :srs, :month_yr, :string
  end
end
