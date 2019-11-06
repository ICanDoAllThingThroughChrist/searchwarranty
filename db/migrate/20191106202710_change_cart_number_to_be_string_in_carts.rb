class ChangeCartNumberToBeStringInCarts < ActiveRecord::Migration[5.1]
  def change
    change_column :carts, :cart_number, :string
  end
end
