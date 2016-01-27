require 'rails_helper'
RSpec.describe Movie do

  it "is_expected create a movie" do
    FactoryGirl.build(:movie)
  end

  describe "name" do
    it { is_expected validate_presence_of(:name) }
  end

  describe "language" do
    it { is_expected validate_presence_of(:language) }
  end

  describe "genre" do
    it { is_expected validate_presence_of(:genre) }
  end

  describe "duration" do
    it { is_expected validate_presence_of(:duration) }
    it { is_expected validate_numericality_of(:duration) }
  end

  describe "movie_format" do
    it { is_expected validate_presence_of(:movie_format) }
  end

  describe "trailer_url" do
    it { is_expected validate_presence_of(:trailer_url) }
  end

  describe "rating" do
    it { is_expected validate_presence_of(:rating) }
    it { is_expected validate_numericality_of(:rating) }
  end

  describe "release_date" do
    it { is_expected validate_presence_of(:release_date) }
  end
end
