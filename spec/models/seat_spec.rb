require "rails_helper"

RSpec.describe Seat do
  it "is_expected.to create a seat" do
    FactoryGirl.build(:seat)
  end

  describe "row" do
    it { is_expected.to validate_presence_of(:row) }
    it { is_expected.to validate_length_of(:row).within(1..2) }
  end

  describe "seat_number" do
    it { is_expected.to validate_presence_of(:seat_number) }
  end

  describe "seat_price" do
    it { is_expected.to validate_presence_of(:seat_price) }
  end

  describe "seat_type" do
    it { is_expected.to validate_presence_of(:seat_type) }
  end

end
