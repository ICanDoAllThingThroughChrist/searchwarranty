class AddGarbagedayToSrs < ActiveRecord::Migration[5.2]
  def change
    add_column :srs, :garbage_day, :string
  end
end
