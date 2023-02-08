class CreateClimateData < ActiveRecord::Migration[7.0]
  def change
    create_table :climate_data do |t|
      t.datetime :measured_at
      t.float :ambient_temperature
      t.float :ambient_humidity
      t.float :atmospheric_pressure
      t.uuid :sensor_id
      t.integer :room_no
      t.string :position
      t.datetime :received_at
    end
  end
end
