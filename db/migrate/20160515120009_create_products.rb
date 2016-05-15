class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.float :width
      t.float :height
      t.float :length
      t.float :weight
      t.integer :agreement_number,  unique: true
      t.float :temperature_min
      t.float :temperature_max
      t.float :humidity_min
      t.float :humidity_max
      t.datetime :receipt_date
      t.datetime :expiration_date
      t.references :client, index: true, foreign_key: true
      t.references :stack, index: true, foreign_key: true
      t.integer :position

      t.timestamps null: false
    end
  end
end
