class AddAdminToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin, :Boolean
    change_column_default(:users, :admin, false)
  end
end
