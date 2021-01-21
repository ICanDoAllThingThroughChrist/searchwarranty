class AddAttributesToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :orderNum, :text
    add_column :requests, :itemNum, :text
    add_column :requests, :itemDesc, :text
  end
end
