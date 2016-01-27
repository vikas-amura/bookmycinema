require "rails_helper"

RSpec.describe Theatre do
  it "is_expected.to create a theatre" do
    FactoryGirl.build(:theatre)
  end

  describe "name" do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe "address" do
    it { is_expected.to validate_presence_of(:address) }
  end

  describe "city" do
    it { is_expected.to validate_presence_of(:city) }
  end

end
