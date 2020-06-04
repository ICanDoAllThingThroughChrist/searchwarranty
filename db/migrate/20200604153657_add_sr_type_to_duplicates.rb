class AddSrTypeToDuplicates < ActiveRecord::Migration[5.2]
  def change
    add_column :duplicates, :sr_type, :string
  end
end
