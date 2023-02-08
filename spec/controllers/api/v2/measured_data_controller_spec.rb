require 'rails_helper'

RSpec.describe Api::V2::MeasuredDataController, type: :controller do

  let(:datum_1) do
    Api::V2::MeasuredDatum.create measurand: "Room 438",
                                  measuring_instrument: instrument,
                                  quantity: "ambient_temperature",
                                  value: "23.78",
                                  unit: "degC",
                                  measured_at: '2022-01-02 03:00:01',
                                  json: { "forecast": "bright" }
  end
  let(:datum_2) do
    Api::V2::MeasuredDatum.create measurand: "Room 438",
                                  measuring_instrument: instrument,
                                  quantity: "ambient_temperature",
                                  value: "30.01",
                                  unit: "degC",
                                  measured_at: '2022-01-04 03:00:01',
                                  json: { "forecast": "bright" }
  end

  describe "GET index" do

    it "renders the index" do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it "renders the correct index size" do
      get :index
      expect(JSON.parse(response.body).size).to eq(2)
    end

    # it "correctly handles a measured_at filter" do
    #   get :index, params: { filter: { measured_at: '2022-01-03..2022-01-05' }, format: :json }
    #   expect(response).to have_http_status(:ok)
    #   expect(JSON.parse(response.body).size).to eq(1)
    # end

  end

end
