class AddAttributesToCarts < ActiveRecord::Migration[5.1]
  def change
    add_column :carts, :delivered, :integer
    add_column :carts, :replaced_cart, :integer
    add_column :carts, :serviced, :integer
    add_column :carts, :replace_wheel_lid, :integer
  end
end
