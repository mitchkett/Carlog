class CreateServiceRules < ActiveRecord::Migration
  def self.up
    create_table :service_rules do |t|
      t.string :service_job_type
      t.integer :time_frequency
      t.integer :mileage_frequency

      t.timestamps
    end
  end

  def self.down
    drop_table :service_rules
  end
end
