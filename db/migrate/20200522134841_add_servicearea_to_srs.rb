class AddServiceareaToSrs < ActiveRecord::Migration[5.2]
  def change
    add_column :srs, :service_area, :string
  end
end
