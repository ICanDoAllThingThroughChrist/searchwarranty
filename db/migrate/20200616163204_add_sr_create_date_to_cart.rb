class AddSrCreateDateToCart < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :sr_create_date, :datetime
    change_column :carts, :sr_create_date, 'datetime USING CAST(sr_create_date AS timestamp)'
  end
end
