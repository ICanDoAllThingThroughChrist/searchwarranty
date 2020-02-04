class AddAttributesToSr < ActiveRecord::Migration[5.1]
  def change
    add_column :srs, :client, :string
    add_column :srs, :garbage_route, :string
    add_column :srs, :heavy_trash_quad, :string
    add_column :srs, :sr_owner, :string
    add_column :srs, :sr_creator, :string
    add_column :srs, :resolve_days, :integer
    add_column :srs, :street_num, :integer
    add_column :srs, :client_street, :string
    add_column :srs, :city, :string
    add_column :srs, :state, :string
    add_column :srs, :zip, :integer
    add_column :srs, :phone_number, :string
    add_column :srs, :email_address, :string
    add_column :srs, :garbage_day1, :string
    add_column :srs, :garbage_quad, :string
    add_column :srs, :recycle_day1, :string
    add_column :srs, :recycle_route, :string
    add_column :srs, :resolution_time, :integer
  end
end
