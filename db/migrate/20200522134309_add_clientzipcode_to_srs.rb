class AddClientzipcodeToSrs < ActiveRecord::Migration[5.2]
  def change
    add_column :srs, :client_zip_code, :string
  end
end
