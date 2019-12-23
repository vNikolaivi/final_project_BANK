class AddColumsToTableDeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :birthday, :date
    add_column :users, :geneder, :string
    add_column :users, :city_id, :string
    add_column :users, :is_deleted, :string
    add_column :users, :is_blocked, :string
    add_column :users, :phone, :integer
  end
end
