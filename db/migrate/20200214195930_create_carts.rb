class CreateCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :carts do |t|
      t.string :sr_number
      t.string :client
      t.string :service_location
      t.string :status
      t.decimal :client_str_no
      t.string :client_str_name
      t.decimal :client_zip_code
      t.string :phone_number
      t.string :email_address
      t.datetime :create_date
      t.datetime :due_date
      t.datetime :closed_date
      t.decimal :overdue
      t.string :agent_name
      t.string :super_neighborhood
      t.decimal :tax_id
      t.string :service_area
      t.string :district
      t.string :key_map
      t.string :management_district
      t.string :garbage_route
      t.string :garbage_day
      t.string :garbage_quad
      t.string :recycle_route
      t.string :recycle_day
      t.string :recycle_quad
      t.string :heavy_trash_day
      t.string :heavy_trash_quad
      t.string :subject
      t.string :reason
      t.string :service_type
      t.string :queue
      t.string :sla
      t.string :container_problem
      t.string :container_damage
      t.string :case_note
      t.string :resolution_comment
      t.string :channel_type
      t.string :other_description
      t.string :title
      t.decimal :x
      t.decimal :y
      t.decimal :latitude
      t.decimal :longitude
      t.decimal :tax_id1
      t.string :unique
      t.integer :cart_number

      t.timestamps
    end
  end
end
