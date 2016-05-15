class CreateAgreements < ActiveRecord::Migration
  def change
    create_table :agreements do |t|
      t.datetime :receipt_date
      t.datetime :expiration_date
      t.references :client, index: true, foreign_key: true
      t.references :stack, index: true, foreign_key: true
      t.integer :position

      t.timestamps null: false
    end
  end
end
