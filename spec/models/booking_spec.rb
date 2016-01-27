require "rails_helper"
require 'shoulda/matchers'

describe Booking do

  it "should create a booking" do
    FactoryGirl.build(:booking)
  end

  describe "ticket_numbers" do
    it { should validate_presence_of(:ticket_numbers) }
    it { should validate_numericality_of(:ticket_numbers) }
  end

  describe "number_of_tickets" do
    it { should validate_presence_of(:number_of_tickets) }
    it { should validate_numericality_of(:number_of_tickets) }
  end

  describe "amount" do
    it { should validate_presence_of(:amount) }
    it { should validate_numericality_of(:amount) }
  end

  describe "payment_mode" do
    it { should validate_presence_of(:payment_mode) }
  end

  describe "card_type" do
    it { should validate_presence_of(:card_type) }
  end

  describe "card_number" do
    it { should validate_presence_of(:card_number) }
    it { should validate_numericality_of(:card_number) }
  end

end
