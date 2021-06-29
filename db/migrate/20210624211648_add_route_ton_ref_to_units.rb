class AddRouteTonRefToUnits < ActiveRecord::Migration[5.2]
  def change
    add_reference :route_tons, :unit, foreign_key: true
  end
end
