class RemoveColumnFromTransaction < ActiveRecord::Migration[5.2]
  def change
    remove_column :transactions, :sender_account_number_id
    remove_column :transactions, :recipient_account_number_id
  end
end
