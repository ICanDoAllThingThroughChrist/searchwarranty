class RenameMobilePhoneToCell < ActiveRecord::Migration[5.2]
  def change
    rename_column :facilities, :poc_mobile_phone, :poc_cell
  end
end
