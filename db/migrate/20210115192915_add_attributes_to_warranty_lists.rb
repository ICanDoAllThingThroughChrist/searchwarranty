class AddAttributesToWarrantyLists < ActiveRecord::Migration[5.2]
  def change
    add_column :warranty_lists, :BegNum, :Integer
    add_column :warranty_lists, :WarrantyStart, :Date
    add_column :warranty_lists, :EndNum, :Integer
    add_column :warranty_lists, :WarrantyEnd, :Date
  end
end
