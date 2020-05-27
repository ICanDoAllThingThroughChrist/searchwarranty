class AddClientstrnoToSrs < ActiveRecord::Migration[5.2]
  def change
    add_column :srs, :client_str_no, :string
  end
end
