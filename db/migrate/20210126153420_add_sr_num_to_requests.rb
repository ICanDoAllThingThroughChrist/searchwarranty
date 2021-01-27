class AddSrNumToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :SrNum, :Integer
  end
end
