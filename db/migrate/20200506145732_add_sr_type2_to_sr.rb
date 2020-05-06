class AddSrType2ToSr < ActiveRecord::Migration[5.2]
  def change
    add_column :srs, :sr_type_2, :string
  end
end
