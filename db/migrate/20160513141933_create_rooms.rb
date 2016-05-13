class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.float :volume
      t.float :temperature_min
      t.float :temperature_max
      t.float :wet_min
      t.float :wet_max

      t.timestamps null: false
    end
  end
end
