class CreateOpenSrs < ActiveRecord::Migration[5.2]
  def change
    create_table :open_srs do |t|
      t.string :case_numbe
      t.string :sr_type
      t.string :sec_name
      t.string :quad
      t.string :day

      t.timestamps
    end
  end
end
