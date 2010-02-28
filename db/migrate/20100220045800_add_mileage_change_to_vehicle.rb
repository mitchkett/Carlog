class AddMileageChangeToVehicle < ActiveRecord::Migration
  def self.up
    add_column :vehicles, :mileage_last_changed_at, :datetime
  end

  def self.down
    remove_column :vehicles, :mileage_last_changed_at
  end
end
