class CreateManagers < ActiveRecord::Migration[5.2]
  def change
    create_table :managers do |t|
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.string :email
      t.string :encrypted_password

      t.timestamps
    end
  end
end
