# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_01_11_084741) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "api_tokens", force: :cascade do |t|
    t.uuid "token"
    t.string "issued_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "climate_data", force: :cascade do |t|
    t.datetime "measured_at"
    t.float "ambient_temperature"
    t.float "ambient_humidity"
    t.float "atmospheric_pressure"
    t.uuid "sensor_id"
    t.integer "room_no"
    t.string "position"
    t.datetime "received_at"
  end

end
