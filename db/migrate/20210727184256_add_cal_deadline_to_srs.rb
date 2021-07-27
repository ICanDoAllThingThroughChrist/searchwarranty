class AddCalDeadlineToSrs < ActiveRecord::Migration[5.2]
  def change
    add_column :srs, :calcDeadline, :datetime
  end
end
