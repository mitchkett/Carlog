class CreateServiceJobs < ActiveRecord::Migration
  def self.up
    create_table :service_jobs do |t|
      t.integer :service_visit_id
      t.string :subject
      t.decimal :parts_cost
      t.decimal :labor_cost
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :service_jobs
  end
end
