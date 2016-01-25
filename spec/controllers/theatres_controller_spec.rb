require 'rails_helper'

RSpec.describe TheatresController, type: :controller do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @user.confirm!
      sign_in @user
      @theatre = FactoryGirl.attributes_for(:theatre).stringify_keys

    end

  let(:valid_attributes) {
    {"name"=>@theatre['name'], "address"=>@theatre['address'], "city"=>@theatre['city']}
  }

  let(:invalid_attributes) {
   {"name"=>" ", "address"=>"Pune", "city"=>"Pune"}
  }

   describe "GET #show" do
    it "assigns the requested theatre as @theatre" do
      theatre = Theatre.create! valid_attributes
      get :show, {:id => theatre.to_param}
      expect(assigns(:theatre)).to eq(theatre)
    end
  end

  describe "GET #new" do
    it "assigns a new theatre as @theatre" do
      get :new, {}
      expect(assigns(:theatre)).to be_a_new(Theatre)
    end
  end


  describe "POST #create" do
    context "with valid params" do
      it "creates a new Theatre" do
        expect {
          post :create, {:theatre =>  @theatre}
        }.to change(Theatre, :count).by(1)
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

  describe "DELETE #destroy" do
    it "destroys the requested theatre" do
      theatre = Theatre.create! valid_attributes
      expect {
        delete :destroy, {:id => theatre.to_param}
      }.to change(Theatre, :count).by(-1)
    end

    it "redirects to the theatres list" do
      theatre = Theatre.create! valid_attributes
      delete :destroy, {:id => theatre.to_param}
      expect(response).to redirect_to(theatres_url)
    end
  end


end
