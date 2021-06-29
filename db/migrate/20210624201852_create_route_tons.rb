class CreateRouteTons < ActiveRecord::Migration[5.2]
  def change
    create_table :route_tons do |t|
      t.integer :tons
      t.datetime :created_at
      t.timestamp
    end
  end
end
