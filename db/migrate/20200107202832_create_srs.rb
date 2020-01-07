class CreateSrs < ActiveRecord::Migration[5.1]
  def change
    create_table :srs do |t|
      t.string :case_number
      t.string :sr_location
      t.string :county
      t.string :district
      t.string :neighborhood
      t.bigint :tax_id
      t.string :trash_quad
      t.string :recycle_quad
      t.string :trash_day
      t.string :heavy_trash_day
      t.string :recycle_day
      t.string :key_map
      t.string :management_district
      t.string :department
      t.string :division
      t.string :sr_type
      t.string :queue
      t.integer :sla
      t.string :status
      t.datetime :sr_create_date
      t.datetime :due_date
      t.datetime :date_closed
      t.integer :overdue
      t.string :title
      t.integer :x
      t.integer :y
      t.float :latitude
      t.float :longitude
      t.string :channel_type

      t.timestamps
    end
  end
end
