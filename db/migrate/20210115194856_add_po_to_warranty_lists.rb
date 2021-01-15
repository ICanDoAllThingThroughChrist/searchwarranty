class AddPoToWarrantyLists < ActiveRecord::Migration[5.2]
  def change
    add_column :warranty_lists, :PO, :string
  end
end
