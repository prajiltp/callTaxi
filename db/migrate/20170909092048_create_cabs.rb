class CreateCabs < ActiveRecord::Migration[5.1]
  def change
    create_table :cabs do |t|
      t.string :number
      t.boolean :pink, default: false
      t.float :curr_lat
      t.float :curr_long
      t.string :contact_number
      t.boolean :available, default: true

      t.timestamps
    end
  end
end
