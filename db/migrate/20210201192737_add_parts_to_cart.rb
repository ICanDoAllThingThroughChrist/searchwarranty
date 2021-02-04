class AddPartsToCart < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :part, :integer
    add_column :carts, :repair_replace, :integer
  end
end
