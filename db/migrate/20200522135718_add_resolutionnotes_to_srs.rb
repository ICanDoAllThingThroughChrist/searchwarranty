class AddResolutionnotesToSrs < ActiveRecord::Migration[5.2]
  def change
    add_column :srs, :resolution_notes, :string
  end
end
