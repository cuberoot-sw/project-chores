class RemoveOwnerFromProjectchores < ActiveRecord::Migration
  def up
    remove_column :projectchores, :owner
  end

  def down
    add_column :projectchores, :owner, :string
  end
end
