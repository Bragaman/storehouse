class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.float :width
      t.float :height
      t.float :length
      t.float :weight
      t.integer :agreement_number
      t.float :temperature_min
      t.float :temperature_max
      t.float :humidity_min
      t.float :humidity_max
      t.references :agreement, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
