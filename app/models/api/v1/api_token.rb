module Api
  module V1
    class ApiToken < ApplicationRecord
      self.table_name = 'api_tokens'
    end
  end
end
