class AddTypeToServiceJobs < ActiveRecord::Migration
  def self.up
    add_column :service_jobs, :service_job_type, :string
  end

  def self.down
    remove_column :service_jobs, :service_job_type
  end
end
