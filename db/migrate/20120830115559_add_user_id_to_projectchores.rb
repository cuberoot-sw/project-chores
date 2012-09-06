class AddUserIdToProjectchores < ActiveRecord::Migration
  def change
    add_column :projectchores, :user_id, :integer
  end
end
