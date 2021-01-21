class AddAttributesToWarrantyList < ActiveRecord::Migration[5.2]
  def change
    add_column :warranty_lists, :OrderNum, :Integer
    add_column :warranty_lists, :ItemNum, :text
    add_column :warranty_lists, :ItemDesc, :text
    add_column :warranty_lists, :SoldToNum, :Integer
  end
end
