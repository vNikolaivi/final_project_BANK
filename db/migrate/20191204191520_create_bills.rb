class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.integer :user_id
      t.string :bill_type
      t.float :amount
      t.float :percent
      t.datetime :created_at
      t.datetime :updated_at
      t.datetime :close_at
      t.datetime :replanishment_at
      t.float :regular_replanishment_amount
      t.datetime :expired_bill_at
      t.string :early_close_status
      t.float :amount_limit

      t.timestamps
    end
  end
end
