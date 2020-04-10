class CreateWarrantyLists < ActiveRecord::Migration[5.2]
  def change
    create_table :warranty_lists do |t|
      t.integer :case1
      t.integer :case2
      t.date :expiration_date

      t.timestamps
    end
  end
end
