class CreateResidents < ActiveRecord::Migration[5.2]
  def change
    create_table :residents do |t|
      t.string :unique
      t.string :sr_type
      t.float :case_number

      t.timestamps
    end
  end
end
