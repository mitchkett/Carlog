class CreateServiceProviders < ActiveRecord::Migration
  def self.up
    create_table :service_providers do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :phone
      t.string :website

      t.timestamps
    end
  end

  def self.down
    drop_table :service_providers
  end
end
