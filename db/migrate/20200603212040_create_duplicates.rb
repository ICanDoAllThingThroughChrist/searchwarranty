class CreateDuplicates < ActiveRecord::Migration[5.2]
  def change
    create_table :duplicates do |t|
      t.integer :case_number
      t.string :trash_quad
      t.integer :overdue
      t.string :expression
    end
  end
end
