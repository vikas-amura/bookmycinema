describe Comment do

  it "should create a movie" do
    FactoryGirl.build(:comment)
  end

  describe "rating" do
    it { should validate_presence_of(:rating) }
    it {should validate_numericality_of(:rating)}
  end

  describe "review" do
    it { should validate_presence_of(:review) }
  end

  describe "status" do
    it { should validate_presence_of(:status) }
  end

  describe "approved_by" do
    it { should validate_presence_of(:approved_by) }
  end
end
