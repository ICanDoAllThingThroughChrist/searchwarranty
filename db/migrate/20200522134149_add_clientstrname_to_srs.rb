class AddClientstrnameToSrs < ActiveRecord::Migration[5.2]
  def change
    add_column :srs, :client_str_name, :string
  end
end
