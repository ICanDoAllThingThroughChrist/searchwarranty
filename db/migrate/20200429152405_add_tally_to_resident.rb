class AddTallyToResident < ActiveRecord::Migration[5.2]
  def change
    add_column :residents, :tally, :integer
  end
end
