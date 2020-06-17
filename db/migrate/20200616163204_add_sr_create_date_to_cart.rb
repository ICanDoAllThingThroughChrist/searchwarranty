class AddSrCreateDateToCart < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :sr_create_date, :datetime
  end
end
