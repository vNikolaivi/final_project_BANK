class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :sender_id
      t.integer :sender_account_number_id
      t.integer :recipient_id
      t.integer :recipient_account_number_id
      t.float :amount
      t.string :status
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
