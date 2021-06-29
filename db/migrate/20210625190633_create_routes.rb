class CreateRoutes < ActiveRecord::Migration[5.2]
  def change
    create_table :routes do |t|
      t.string :route
      t.datetime :created_at

      t.timestamps
    end
  end
end
