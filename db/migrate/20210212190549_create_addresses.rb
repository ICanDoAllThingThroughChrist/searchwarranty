class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :address
      t.integer :sr_number, limit: 8

      t.timestamps
    end
  end
end
