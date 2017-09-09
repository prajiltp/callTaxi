class CreateRides < ActiveRecord::Migration[5.1]
  def change
    create_table :rides do |t|
      t.integer :cab_id
      t.string :contact_number
      t.float :starting_latt
      t.float :starting_long
      t.float :end_latt
      t.float :end_long
      t.datetime :started_at
      t.datetime :end_at
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
