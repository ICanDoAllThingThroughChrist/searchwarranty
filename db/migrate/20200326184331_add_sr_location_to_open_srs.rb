class AddSrLocationToOpenSrs < ActiveRecord::Migration[5.2]
  def change
    add_column :open_srs, :sr_locatio, :string
  end
end
