class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.integer :user_id
      t.string  :card_number
      t.string  :security_type
      t.string  :security_code
      t.string  :expires_end

      t.timestamps
    end
  end
end
