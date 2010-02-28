class AddVehicleMileageFields < ActiveRecord::Migration
  def self.up
    add_column :vehicles, :current_mileage, :integer
    add_column :vehicles, :average_mileage, :integer
  end

  def self.down
    remove_column :vehicles, :average_mileage
    remove_column :vehicles, :current_mileage
  end
end
