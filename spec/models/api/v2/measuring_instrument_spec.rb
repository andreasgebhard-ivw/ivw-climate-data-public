require 'rails_helper'

RSpec.describe Api::V2::MeasuringInstrument, type: :model do

  let(:instrument) do
    Api::V2::MeasuringInstrument.create brand_name: 'Calliper 150 mm',
                                        manufacturer: "UL Laboratories",
                                        type: 'Calliper',
                                        manufacturer_serial_no: '5874972-10a',
                                        inventory_no: '20212015820'
  end

  it "is valid with valid attributes" do
    expect(instrument).to be_valid
  end

  it "is valid with all-blank attributes" do
    expect(Api::V2::MeasuringInstrument.new).to be_valid
  end

end
