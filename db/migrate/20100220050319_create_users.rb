class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email_address
      t.string :password
      t.datetime :last_logged_in_at
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :contact_phone

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
