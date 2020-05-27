class AddCloseddateToSrs < ActiveRecord::Migration[5.2]
  def change
    add_column :srs, :closed_date, :datetime
  end
end
