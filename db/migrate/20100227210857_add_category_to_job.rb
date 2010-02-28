class AddCategoryToJob < ActiveRecord::Migration
  def self.up
    add_column :service_jobs, :maintenance_category_id, :integer
    remove_column :service_jobs, :subject
  end

  def self.down
    add_column :service_jobs, :subject, :string
    remove_column :service_jobs, :maintenance_category_id
  end
end
