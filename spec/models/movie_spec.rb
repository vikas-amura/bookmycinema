describe Movie do

  it "should create a movie" do
    FactoryGirl.build(:movie)
  end

  describe "name" do
    it { should validate_presence_of(:name) }
  end

  describe "language" do
    it { should validate_presence_of(:language) }
  end

  describe "genre" do
    it { should validate_presence_of(:genre) }
  end

  describe "duration" do
    it { should validate_presence_of(:duration) }
    it { should validate_numericality_of(:duration) }
  end

  describe "movie_format" do
    it { should validate_presence_of(:movie_format) }
  end

  describe "trailer_url" do
    it { should validate_presence_of(:trailer_url) }
  end

  describe "rating" do
    it { should validate_presence_of(:rating) }
    it { should validate_numericality_of(:rating) }
  end

  describe "release_date" do
    it { should validate_presence_of(:release_date) }
  end
end
