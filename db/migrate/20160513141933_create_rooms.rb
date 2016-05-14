class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name, null: false
      t.float :volume, null: false
      t.float :temperature_min, null: false
      t.float :temperature_max, null: false
      t.float :wet_min, null: false 
      t.float :wet_max, null: false

      t.timestamps null: false
    end
  end
end
