require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  let!(:user) {FactoryGirl.create(:user)}
  let!(:movie) {FactoryGirl.create (:movie)}

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @request.env["HTTP_REFERER"] = '/'
    user.confirm!
    sign_in user
end

describe "GET show " do
   it "should route to show movie" do
     expect(:get => movie_path(movie.id)).
     to route_to(:controller => "movies", :action => "show",id: movie.id.to_s)
     expect(response.status).to eq(200)
 end

 it "should render show template" do
    get "show",controller: 'movies',id: movie.id
    expect(response).to render_template("show")
end

it "assigns @movie" do
   get "show", controller: 'movies',id: movie.id
   expect(assigns(:movie)).to eq(movie)
end
end

describe "GET edit" do
 it "should route to edit movie" do
   expect(:get => edit_movie_path(movie.id)).
   to route_to(:controller => "movies", :action => "edit",id: movie.id.to_s)
   expect(response.status).to eq(200)
end
it "should render edit template" do
  get "edit",controller: 'movies',id: movie.id
  expect(response).to render_template("edit")
end
it "assigns @movie" do
 get "edit", controller: 'movies',id: movie.id
 expect(assigns(:movie)).to eq(movie)
end
end

describe "POST movie" do
  it "should create a new movie" do
    movie_params = FactoryGirl.attributes_for(:movie)
    post "create",controller: "movies" ,action: "create",movie: movie_params
  end
end


end
