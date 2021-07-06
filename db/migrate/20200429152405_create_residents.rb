class CreateResidents < ActiveRecord::Migration[5.2]
    def change
          create_table :residents do |t|
            t.integer :ID
            t.string :unique
            t.string :sr_type
            t.integer :case_number
            t.integer :tally
            t.timestamps
          end
    end
end
