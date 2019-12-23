class CreateManagerNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :manager_notifications do |t|
      t.integer :manager_id
      t.integer :bill_id
      t.text :message

      t.timestamps
    end
  end
end
