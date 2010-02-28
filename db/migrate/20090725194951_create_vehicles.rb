class CreateVehicles < ActiveRecord::Migration
  def self.up
    create_table :vehicles do |t|
      t.integer :year
      t.string :make
      t.string :model
      t.string :trim
      t.string :exterior_color
      t.string :interior_color

      t.timestamps
    end
  end

  def self.down
    drop_table :vehicles
  end
end
