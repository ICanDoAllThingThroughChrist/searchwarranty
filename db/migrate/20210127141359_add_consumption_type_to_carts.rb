class AddConsumptionTypeToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :consumption_type, :integer
  end
end
