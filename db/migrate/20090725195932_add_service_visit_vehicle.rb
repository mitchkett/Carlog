class AddServiceVisitVehicle < ActiveRecord::Migration
  def self.up
    add_column :service_visits, :vehicle_id, :integer
  end

  def self.down
    remove_column :service_visits, :vehicle_id
  end
end
