class ChangeVehicleMakeModel < ActiveRecord::Migration
  def self.up
    remove_column :vehicles, :make
    remove_column :vehicles, :model
    add_column :vehicles, :make_id, :integer
    add_column :vehicles, :model_id, :integer
  end

  def self.down
    remove_column :vehicles, :model_id
    remove_column :vehicles, :make_id
    add_column :vehicles, :model, :string
    add_column :vehicles, :make, :string
  end
end
