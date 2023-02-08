require 'rails_helper'

RSpec.describe Api::V2::Calibration, type: :model do

  let(:instrument) do
    Api::V2::MeasuringInstrument.create brand_name: 'Calliper 150 mm',
                                        manufacturer: "UL Laboratories",
                                        type: 'Calliper',
                                        manufacturer_serial_no: '5874972-10a',
                                        inventory_no: '20212015820'
  end

  let(:calibration) do
    Api::V2::Calibration.create performed_by: 'IVW-Messmittelkalibrierservice',
                                        measuring_instrument: instrument,
                                        valid_from: Time.now,
                                        valid_to: (Time.now + 2.years),
                                        type: 'international'
  end


  it "is valid with valid attributes" do
    expect(calibration).to be_valid
  end

  it "is invalid if measuring_instrument is blank" do
    calibration.measuring_instrument = nil
    expect(calibration).not_to be_valid
  end

  it 'finds its associated instrument' do
    expect(calibration.measuring_instrument).to eq(instrument)
  end

  it 'is included in its instrument\'s calibrations association collection' do
    expect(instrument.calibrations).to include(calibration)
  end

end
