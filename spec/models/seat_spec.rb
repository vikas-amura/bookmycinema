describe Seat do
  it "should create a seat" do
    FactoryGirl.build(:seat)
  end

  describe "row" do
    it { should validate_presence_of(:row) }
    it { should validate_length_of(:row).is_at_least(1).is_at_most(2) }
  end

  describe "seat_number" do
    it { should validate_presence_of(:seat_number) }
  end

  describe "seat_price" do
    it { should validate_presence_of(:seat_price) }
  end

  describe "seat_type" do
    it { should validate_presence_of(:seat_type) }
  end

end
