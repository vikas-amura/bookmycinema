describe Theatre do
  it "should create a theatre" do
    FactoryGirl.build(:theatre)
  end

  describe "name" do
    it { should validate_presence_of(:name) }
  end

  describe "address" do
    it { should validate_presence_of(:address) }
  end

  describe "city" do
    it { should validate_presence_of(:city) }
  end

end
