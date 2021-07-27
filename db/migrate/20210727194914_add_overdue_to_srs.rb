class AddOverdueToSrs < ActiveRecord::Migration[5.2]
  def change
    add_column :srs, :overdue, :string
  end
end
