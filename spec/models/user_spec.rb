describe User do

  it "should create a user" do
    FactoryGirl.build(:user)
  end

  describe "first_name" do
    it { should validate_presence_of(:first_name) }
    it { should validate_length_of(:first_name).is_at_least(2) }
  end

  describe "last_name" do
    it { should validate_presence_of(:last_name) }
    it { should validate_length_of(:last_name).is_at_least(2) }
  end

  describe "email" do
    it { should validate_presence_of(:email) }
  end

  describe "mobile" do
    it { should validate_presence_of(:mobile) }
  end

  describe "gender" do
    it { should validate_presence_of(:gender) }
  end

  describe "date_of_birth" do
    it { should validate_presence_of(:date_of_birth) }
  end
end
