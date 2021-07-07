class AddAttributesToSrs < ActiveRecord::Migration[5.2]
  def change
    add_column :srs, :case_title, :string
    add_column :srs, :Resolve_by_SLA_status, :string
    add_column :srs, :resolve_by, :datetime
  end
end
