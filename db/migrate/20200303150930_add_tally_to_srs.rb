class AddTallyToSrs < ActiveRecord::Migration[5.1]
  def change
    add_column :srs, :tally, :integer
  end
end
