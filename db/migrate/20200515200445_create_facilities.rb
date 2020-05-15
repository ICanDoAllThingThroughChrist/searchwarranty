class CreateFacilities < ActiveRecord::Migration[5.2]
  def change
    create_table :facilities do |t|
      t.string :address
      t.string :location
      t.string :op_days
      t.string :op_hrs
      t.string :poc_name
      t.string :poc_phone
      t.string :poc_mobile_phone
      t.string :notes

      t.timestamps
    end
  end
end
