class CreateStacks < ActiveRecord::Migration
  def change
    create_table :stacks do |t|
      t.integer :number
      t.references :room, index: true, foreign_key: true
      t.integer :place_count
      t.float :place_height
      t.float :place_width
      t.float :place_length
      t.float :max_total_load

      t.timestamps null: false
    end
  end
end
