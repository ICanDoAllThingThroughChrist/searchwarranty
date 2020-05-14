class CreateMissedHvies < ActiveRecord::Migration[5.2]
  def change
    create_table :missed_hvies do |t|
      t.string :sr_location
      t.string :trash_quad
      t.string :case_number
      t.integer :overdue

      t.timestamps
    end
  end
end
