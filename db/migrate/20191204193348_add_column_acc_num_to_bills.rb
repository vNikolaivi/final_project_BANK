class AddColumnAccNumToBills < ActiveRecord::Migration[5.2]
  def change
    add_column :bills, :account_number, :integer
  end
end
