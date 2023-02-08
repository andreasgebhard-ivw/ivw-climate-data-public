require 'rails_helper'

RSpec.describe Api::V2::ApiToken, type: :model do

  let(:api_token) do
    Api::V2::ApiToken.create token: SecureRandom.uuid,
                             issued_to: 'icd-client-438'
  end

  it "is valid with valid attributes" do
    expect(api_token).to be_valid
  end

  it "is invalid if token is blank" do
    api_token.token = nil
    expect(api_token).not_to be_valid
  end

  it "is invalid if token is a non-uuid string" do
    api_token.token = "44ab2cc4-f9e5-45c9-a08d-de6a98c0xxxx"
    expect(api_token).not_to be_valid
  end

end
