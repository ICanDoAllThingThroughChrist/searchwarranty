class CreateCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :carts do |t|
      t.string :cart_number

      t.timestamps
    end
  end
end
