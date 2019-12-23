class CreateCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :short_code
      t.integer :phone_code

      t.timestamps
    end
  end
end
