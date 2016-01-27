require "rails_helper"

RSpec.describe Show do
  it "is_expected.to create a show" do
    FactoryGirl.build(:show)
  end

  # describe "starttime" do
  #   it { is_expected.to validate_presence_of(:starttime) }
  # end
  #
  # describe "endtime" do
  #   it { is_expected.to validate_presence_of(:endtime) }
  # end
end
