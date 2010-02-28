class AddVehicleVin < ActiveRecord::Migration
  def self.up
    add_column :vehicles, :vin, :string
  end

  def self.down
    remove_column :vehicles, :vin
  end
end
