class AddPoToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :po, :text
  end
end
