class AddReasonToSrs < ActiveRecord::Migration[5.2]
  def change
    add_column :srs, :reason, :string
  end
end
