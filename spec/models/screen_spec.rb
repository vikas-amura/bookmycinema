describe Screen do

  it "should create a screen" do
    FactoryGirl.build(:screen)
  end

  describe "name" do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(1).is_at_most(50) }
  end

  describe "capacity" do
    it { should validate_presence_of(:capacity) }
  end

end
