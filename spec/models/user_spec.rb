require "rails_helper"

RSpec.describe User do

  it "is_expected.to create a user" do
    FactoryGirl.build(:user)
  end

  describe "first_name" do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_length_of(:first_name) }
  end

  describe "last_name" do
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_length_of(:last_name) }
  end

  describe "email" do
    it { is_expected.to validate_presence_of(:email) }
  end

  describe "mobile" do
    it { is_expected.to validate_presence_of(:mobile) }
    it { is_expected.to validate_numericality_of(:mobile) }
    it { is_expected.to validate_length_of(:mobile) }
  end

  describe "gender" do
    it { is_expected.to validate_presence_of(:gender) }
  end

  describe "date_of_birth" do
    it { is_expected.to validate_presence_of(:date_of_birth) }
  end
end
