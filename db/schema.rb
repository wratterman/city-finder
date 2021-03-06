# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171031234211) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "avg_weekly_reports", force: :cascade do |t|
    t.string "month_year"
    t.float "avg_weekly_hours"
    t.float "avg_hourly_wages"
    t.float "avg_weekly_earnings"
    t.bigint "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_avg_weekly_reports_on_state_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.integer "population"
    t.integer "violent_crime"
    t.float "violent_crime_rate"
    t.integer "murder_manslaughter"
    t.float "murder_manslaughter_rate"
    t.integer "rape"
    t.float "rape_rate"
    t.integer "robbery"
    t.float "robbery_rate"
    t.integer "aggrevated_assault"
    t.float "aggrevated_assault_rate"
    t.integer "property_crime"
    t.float "property_crime_rate"
    t.integer "burglary"
    t.float "burglary_rate"
    t.integer "larceny_theft"
    t.float "larceny_theft_rate"
    t.integer "motor_vehicle_theft"
    t.float "motor_vehicle_theft_rate"
    t.bigint "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "crimes", force: :cascade do |t|
    t.integer "year"
    t.integer "population"
    t.integer "violent_crime"
    t.float "violent_crime_rate"
    t.integer "murder_manslaughter"
    t.float "murder_manslaughter_rate"
    t.integer "rape"
    t.float "rape_rate"
    t.integer "robbery"
    t.float "robery_rate"
    t.integer "aggrevated_assault"
    t.float "aggrevated_assault_rate"
    t.integer "property_crime"
    t.float "property_crime_rate"
    t.integer "burglary"
    t.float "burglary_rate"
    t.integer "larceny_theft"
    t.float "larceny_theft_rate"
    t.integer "motor_vehicle_theft"
    t.float "motor_vehicle_theft_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "avg_weekly_reports", "states"
  add_foreign_key "cities", "states"
end
