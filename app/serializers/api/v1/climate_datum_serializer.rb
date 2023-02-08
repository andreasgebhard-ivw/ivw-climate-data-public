module Api
  module V1

  class Api::V1::ClimateDatumSerializer
      include JSONAPI::Serializer

      set_type 'Api::V1::ClimateDatum'
      attributes :ambient_temperature,
                 :ambient_humidity,
                 :atmospheric_pressure,
                 :room_no,
                 :position,
                 :sensor_id
      attribute :measured_at do |climate_datum|
        climate_datum.measured_at.iso8601
      end
      meta do |climate_datum|
        { received_at: climate_datum.received_at.iso8601 }
      end
      link :self do |climate_datum|
        "#{Rails.application.routes.url_helpers.api_v1_climate_datum_url(climate_datum)}.json"
      end
    end

  end
end
