class CreateMaintenanceCategories < ActiveRecord::Migration
  def self.up
    create_table :maintenance_categories do |t|
      t.column :name, :string
      t.column :description, :text
      
      t.timestamps
    end
  end

  def self.down
    drop_table :maintenance_categories
  end
end
