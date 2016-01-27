require "rails_helper"

RSpec.describe Ticket do

  it "is_expected.to create a ticket" do
    FactoryGirl.build(:ticket)
  end

  describe "name" do
    it { is_expected.to validate_presence_of(:number) }
  end

end
