class ChangeIntegerLimitInDuplicates < ActiveRecord::Migration[5.2]
  def change
    change_column :duplicates, :case_number, :integer, limit: 8
  end
end
