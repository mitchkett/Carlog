class CreateServiceVisits < ActiveRecord::Migration
  def self.up
    create_table :service_visits do |t|
      t.date :visit_date
      t.integer :service_provider_id
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :service_visits
  end
end
