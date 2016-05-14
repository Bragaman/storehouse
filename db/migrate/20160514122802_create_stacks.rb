class CreateStacks < ActiveRecord::Migration
  def change
    create_table :stacks do |t|
      t.integer :number, null: false
      t.references :room, index: true, foreign_key: true
      # t.index :room_id, unique: true
      t.integer :place_count, null: false
      t.float :place_height, null: false
      t.float :place_width, null: false
      t.float :place_length, null: false
      t.float :max_total_load, null: false

      t.timestamps null: false
    end
  end
end
