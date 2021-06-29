class AddRouteNameToRouteTon < ActiveRecord::Migration[5.2]
  def change
    add_column :route_tons, :route_name, :string
  end
end
