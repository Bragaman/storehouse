class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :entity_name, null: false
      t.text :bank_details, null: false

      t.timestamps null: false
    end

    reversible do |dir|
		dir.up do
				execute("ALTER TABLE clients ADD CONSTRAINT empty_chk CHECK(entity_name != '')")
    	end
    	dir.down do
				execute("ALTER TABLE clients DROP CONSTRAINT empty_chk")
			end
		end
  end
end
