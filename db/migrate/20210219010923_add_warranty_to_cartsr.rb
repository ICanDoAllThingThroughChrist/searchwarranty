class AddWarrantyToCartsr < ActiveRecord::Migration[5.2]
  def change
    add_column :cartsrs, :warranty, :integer
  end
end
