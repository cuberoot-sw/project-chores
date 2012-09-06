class CreateProjectchores < ActiveRecord::Migration
  def change
    create_table :projectchores do |t|
      t.string :description
      t.string :status
      t.string :priority
      t.string :owner
      t.datetime :duedate

      t.timestamps
    end
  end
end
