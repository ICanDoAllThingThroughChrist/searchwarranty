class AddCartSrNumToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :cart_sr_number, :integer
  end
end
