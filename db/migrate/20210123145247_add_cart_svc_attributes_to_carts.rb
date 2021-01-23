class AddCartSvcAttributesToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :replaced_body, :integer
    add_column :carts, :replaced_wheel, :integer
    add_column :carts, :replaced_lid, :integer
    add_column :carts, :repaired_lid, :integer
    add_column :carts, :repaired_wheel, :integer
    add_column :carts, :repaired_body, :integer
  end
end
