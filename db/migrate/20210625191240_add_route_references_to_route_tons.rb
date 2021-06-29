class AddRouteReferencesToRouteTons < ActiveRecord::Migration[5.2]
  def change
    add_reference :route_tons, :route, foreign_key: true
  end
end
