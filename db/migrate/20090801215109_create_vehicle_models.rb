class CreateVehicleModels < ActiveRecord::Migration
  def self.up
    create_table :vehicle_models do |t|
      t.integer :vehicle_make_id
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :vehicle_models
  end
end
