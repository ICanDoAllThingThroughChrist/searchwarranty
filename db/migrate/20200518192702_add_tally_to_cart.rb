class AddTallyToCart < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :tally, :integer
  end
end
