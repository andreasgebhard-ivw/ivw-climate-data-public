module Api
  module V1
    class ClimateDatum < ApplicationRecord
      self.table_name = 'climate_data'
    end
  end
end
