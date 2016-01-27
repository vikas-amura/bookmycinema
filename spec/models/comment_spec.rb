require "rails_helper"

RSpec.describe Comment do

  it "is_expected.to create a movie" do
    FactoryGirl.build(:comment)
  end

  describe "rating" do
    it { is_expected.to validate_presence_of(:rating) }
    it {is_expected.to validate_numericality_of(:rating)}
  end

  describe "review" do
    it { is_expected.to validate_presence_of(:review) }
  end

  describe "status" do
    it { is_expected.to validate_presence_of(:status) }
  end

  describe "approved_by" do
    it { is_expected.to validate_presence_of(:approved_by) }
  end
end
