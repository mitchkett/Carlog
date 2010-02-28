class ConsolidateCostFields < ActiveRecord::Migration
  def self.up
    remove_column :service_jobs, :parts_cost
    remove_column :service_jobs, :labor_cost
    add_column :service_jobs, :cost_in_cents, :integer
  end

  def self.down
    remove_column :service_jobs, :cost_in_cents
    add_column :service_jobs, :labor_cost, :integer
    add_column :service_jobs, :parts_cost, :integer
  end
end
