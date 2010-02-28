class AddServiceVisitMileage < ActiveRecord::Migration
  def self.up
    add_column :service_visits, :mileage, :int
  end

  def self.down
    remove_column :service_visits, :mileage
  end
end
