require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
    before(:each) do
      @user = User.last
      @user.confirm!
      sign_in @user
      @movie = FactoryGirl.attributes_for(:movie).stringify_keys
    end

  let(:valid_attributes) {
    {"name"=>@movie['name'], "language"=>@movie['language'], "genre"=>@movie['genre'],"movie_format"=>@movie['movie_format'],     "trailer_url"=>@movie['trailer_url'], "rating"=>@movie['rating'], "release_date"=>@movie['release_date'],"duration"=>@movie['duration']}
  }

  let(:invalid_attributes) {
    {"name"=>"", "language"=>@movie['language'], "genre"=>@movie['genre'],"movie_format"=>@movie['movie_format'],"trailer_url"=>@movie['trailer_url'], "rating"=>@movie['rating'], "release_date"=>@movie['release_date'],"duration"=>@movie['duration']}
  }

  describe "GET #show" do
    it "assigns the requested movie as @movie" do
      movie = Movie.create! valid_attributes
      get :show, {:id => movie.to_param}
      expect(assigns(:movie)).to eq(movie)
    end
  end

  describe "GET #new" do
    it "assigns a new movie as @movie" do
      get :new, {}
      expect(assigns(:movie)).to be_a_new(Movie)
    end
  end
  describe "GET #edit" do
    it "assigns the requested movie as @movie" do
      movie = Movie.create! valid_attributes
      get :edit, {:id => movie.to_param}
      expect(assigns(:movie)).to eq(movie)
    end
  end


  describe "POST #create" do
    context "with valid params" do
      it "creates a new Movie" do
        expect {
          post :create, {:movie =>  @movie}
        }.to change(Movie, :count).by(1)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved movie as @movie" do
        post :create, {:movie => invalid_attributes}
        expect(assigns(:movie)).to be_a_new(Movie)
      end

      it "re-renders the 'new' template" do
        post :create, {:movie => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end


  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {"name"=>"Inox Movie", "address"=>"Pune", "city"=>"Pune"}
      }

      it "updates the requested movie" do
        movie = Movie.create! valid_attributes
        put :update, {:id => movie.to_param, :movie => new_attributes}
        movie.reload
      end

      it "assigns the requested movie as @movie" do
        movie = Movie.create! valid_attributes
        put :update, {:id => movie.to_param, :movie => valid_attributes}
        expect(assigns(:movie)).to eq(movie)
      end

      it "redirects to the movie" do
        movie = Movie.create! valid_attributes
        put :update, {:id => movie.to_param, :movie => valid_attributes}
        expect(response).to redirect_to(movie)
      end
    end

    context "with invalid params" do
      it "assigns the movie as @movie" do
        movie = Movie.create! valid_attributes
        put :update, {:id => movie.to_param, :movie => invalid_attributes}
        expect(assigns(:movie)).to eq(movie)
      end

      it "re-renders the 'edit' template" do
        movie = Movie.create! valid_attributes
        put :update, {:id => movie.to_param, :movie => invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested movie" do
      movie = Movie.create! valid_attributes
      expect {
        delete :destroy, {:id => movie.to_param}
      }.to change(Movie, :count).by(-1)
    end

    it "redirects to the movies list" do
      movie = Movie.create! valid_attributes
      delete :destroy, {:id => movie.to_param}
      expect(response).to redirect_to(movies_url)
    end
  end


end
