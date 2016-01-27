describe Ticket do

  it "should create a ticket" do
    FactoryGirl.build(:ticket)
  end

  describe "name" do
    it { should validate_presence_of(:number) }
  end

end
