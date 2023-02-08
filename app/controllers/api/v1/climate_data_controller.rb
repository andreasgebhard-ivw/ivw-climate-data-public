module Api
  module V1

    class ClimateDataController < ApplicationController
      before_action :authenticate_user_from_token!, only: [:create]

      def show
        @datum = Api::V1::ClimateDatum.where(id: params[:id]).first
        if @datum
          options = { links: { self: request.url } }
          render json: Api::V1::ClimateDatumSerializer.new(@datum, options).serializable_hash
        else
          head :not_found
        end
      end

      def index
        from = params['from']
        to = params['to']
        room_no = params['room_no']
        if from && to && room_no
          date_rng = Range.new DateTime.parse(from),
                               DateTime.parse(to),
          room_no = room_no.to_i
          @hits = Api::V1::ClimateDatum.where measured_at: date_rng,
                                        room_no: room_no
          position = params['position']
          if position
            @hits = @hits.where 'position = ?',
                                position
          end
          options = {
            links: { self: request.url }
          }
          render json: Api::V1::ClimateDatumSerializer.new(@hits, options).serializable_hash
        else
          render status: :unprocessable_entity
        end

      end

      def create
        data = JSON.parse(request.body.read)
        @datum = Api::V1::ClimateDatum.new data
        @datum.received_at = Time.now
        @datum.save!
        render json: Api::V1::ClimateDatumSerializer.new(@datum).serializable_hash
      end

      private
      def authenticate_user_from_token!
        api_token = params[:api_token]
        if api_token.blank?
          render nothing: true,
                 status: :unauthorized
        else
          if Api::V1::ApiToken.where(token: api_token).size < 1
            render nothing: true,
                   status: :unauthorized
          end
        end
      end
    end

  end
end
