class ChangeCartSrNumberCart < ActiveRecord::Migration[5.2]
  def change
    change_column :carts, :cart_sr_number, :integer, limit: 8
    change_column :carts, :cart_number, :integer, limit: 8
  end

end
