class AddExpressionToSr < ActiveRecord::Migration[5.1]
  def change
    add_column :srs, :expression, :string
  end
end
