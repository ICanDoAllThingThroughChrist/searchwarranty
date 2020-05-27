class AddAgentnameToSrs < ActiveRecord::Migration[5.2]
  def change
    add_column :srs, :agent_name, :string
  end
end
