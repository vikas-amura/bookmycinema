require 'rails_helper'


RSpec.describe TheatresController, type: :controller do

    before(:each) do
        #create new user with admin role
        #@user.confirm!
        #sign_in @user
    end

  let(:valid_attributes) {
    {"name"=>"City Pride", "address"=>"Pune", "city"=>"Pune"}
  }

  let(:invalid_attributes) {
   {"name"=>" ", "address"=>"Pune", "city"=>"Pune"}
  }


  describe "POST #create" do
    context "with valid params" do
      it "creates a new Theatre" do
        post :create, theatre: valid_attributes
        expect(Theatre.count).to eq(120)
      end

      it "redirects to the created theatre" do
        post :create, theatre: valid_attributes
        puts response.inspect
        expect(response).to redirect_to Theatre.last
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved theatre as @theatre" do
        post :create, {:theatre => invalid_attributes}
        expect(assigns(:theatre)).to be_a_new(Theatre)
      end

      it "re-renders the 'new' template" do
        post :create, {:theatre => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end



end
