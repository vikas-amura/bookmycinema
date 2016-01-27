require "rails_helper"

describe Booking do

  it "is_expected.to create a booking" do
    FactoryGirl.build(:booking)
  end

  describe "ticket_numbers" do
    it { is_expected.to validate_presence_of(:ticket_numbers) }
    it { is_expected.to validate_numericality_of(:ticket_numbers) }
  end

  describe "number_of_tickets" do
    it { is_expected.to validate_presence_of(:number_of_tickets) }
    it { is_expected.to validate_numericality_of(:number_of_tickets) }
  end

  describe "amount" do
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_numericality_of(:amount) }
  end

  describe "payment_mode" do
    it { is_expected.to validate_presence_of(:payment_mode) }
  end

  describe "card_type" do
    it { is_expected.to validate_presence_of(:card_type) }
  end

  describe "card_number" do
    it { is_expected.to validate_presence_of(:card_number) }
    it { is_expected.to validate_numericality_of(:card_number) }
  end

end
