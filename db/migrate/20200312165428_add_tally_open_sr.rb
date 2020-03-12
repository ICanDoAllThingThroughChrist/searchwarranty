class AddTallyOpenSr < ActiveRecord::Migration[5.2]
  def change
    add_column :open_srs, :tally, :integer
    add_column :open_srs, :quad_status, :string
  end
end
