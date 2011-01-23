# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100227211138) do

  create_table "maintenance_categories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_jobs", :force => true do |t|
    t.integer  "service_visit_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "service_job_type"
    t.integer  "maintenance_category_id"
    t.integer  "cost_in_cents"
  end

  create_table "service_providers", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.string   "phone"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_rules", :force => true do |t|
    t.string   "service_job_type"
    t.integer  "time_frequency"
    t.integer  "mileage_frequency"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_visits", :force => true do |t|
    t.date     "visit_date"
    t.integer  "service_provider_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "vehicle_id"
    t.integer  "mileage"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email_address"
    t.string   "password"
    t.datetime "last_logged_in_at"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.string   "contact_phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehicle_makes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehicle_models", :force => true do |t|
    t.integer  "vehicle_make_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehicles", :force => true do |t|
    t.integer  "year"
    t.string   "trim"
    t.string   "exterior_color"
    t.string   "interior_color"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "vin"
    t.integer  "make_id"
    t.integer  "model_id"
    t.integer  "current_mileage"
    t.integer  "average_mileage"
    t.integer  "user_id"
    t.datetime "mileage_last_changed_at"
  end

end
