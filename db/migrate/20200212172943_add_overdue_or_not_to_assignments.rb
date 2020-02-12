class AddOverdueOrNotToAssignments < ActiveRecord::Migration[5.1]
  def change
    add_column :assignments, :overdue_or_not, :string
  end
end
