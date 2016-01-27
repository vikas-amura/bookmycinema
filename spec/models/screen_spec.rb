require "rails_helper"

RSpec.describe Screen do

  it "is_expected.to create a screen" do
    FactoryGirl.build(:screen)
  end

  describe "name" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).within(1..50) }
  end

  describe "capacity" do
    it { is_expected.to validate_presence_of(:capacity) }
  end

end
