class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.integer :country_id
      t.string :name
      t.string :short_name
      t.integer :post_code

      t.timestamps
    end
  end
end
