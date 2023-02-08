require 'rails_helper'

RSpec.describe Api::V2::MeasuredDatum, type: :model do

  let(:instrument) do
    Api::V2::MeasuringInstrument.create manufacturer: "UL"
  end

  let(:datum) do
    Api::V2::MeasuredDatum.create measurand: "Room 438",
                                  measuring_instrument: instrument,
                                  quantity: "ambient_temperature",
                                  value: "23.78",
                                  unit: "degC",
                                  measured_at: Time.now.utc.iso8601,
                                  json: { "forecast": "bright" }
  end

  it "is valid with valid attributes" do
    expect(datum).to be_valid
  end
  it "is not valid without measuring_instrument_id" do
    datum.measuring_instrument_id = nil
    expect(datum).to_not be_valid
  end
  it "is not valid when measuring_instrument does not exist" do
    datum.measuring_instrument_id = SecureRandom.uuid
    expect(datum).to_not be_valid
  end
  it "is not valid without measurand" do
    datum.measurand = nil
    expect(datum).to_not be_valid
  end
  it "is not valid without quantity" do
    datum.quantity = nil
    expect(datum).to_not be_valid
  end
  it "is not valid without unit" do
    datum.unit = nil
    expect(datum).to_not be_valid
  end
  it "is not valid without value" do
    datum.value = nil
    expect(datum).to_not be_valid
  end
  it 'finds its associated instrument' do
    expect(datum.measuring_instrument).to eq(instrument)
  end
  it 'is included in its instrument\'s measured_data association collection' do
    expect(instrument.measured_data).to include(datum)
  end


end
