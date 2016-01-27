require 'rails_helper'

RSpec.describe ScreensController, type: :controller do
    before(:each) do
      @user = User.last
      sign_in @user
      @screen = FactoryGirl.attributes_for(:screen).stringify_keys
  end

  let(:valid_attributes) {
    {"name"=>@screen['name'], "capacity"=>@screen['capacity']}
}

let(:invalid_attributes) {
   {"name"=>" ", "capacity"=>@screen['capacity']}
}

describe "GET #show" do
    it "assigns the requested screen as @screen" do
      screen = Screen.create! valid_attributes
      get :show, {:id => screen.to_param}
      expect(assigns(:screen)).to eq(screen)
  end
end

describe "GET #new" do
    it "assigns a new screen as @screen" do
      get :new, {}
      expect(assigns(:screen)).to be_a_new(Screen)
  end
end
describe "GET #edit" do
    it "assigns the requested screen as @screen" do
      screen = Screen.create! valid_attributes
      get :edit, {:id => screen.to_param}
      expect(assigns(:screen)).to eq(screen)
  end
end


describe "POST #create" do
    context "with valid params" do
      it "creates a new Screen" do
        expect {
          post :create, {:screen =>  @screen}
          }.to change(Screen, :count).by(1)
      end
  end

  context "with invalid params" do
      it "assigns a newly created but unsaved screen as @screen" do
        post :create, {:screen => invalid_attributes}
        expect(assigns(:screen)).to be_a_new(Screen)
    end

    it "re-renders the 'new' template" do
        post :create, {:screen => invalid_attributes}
        expect(response).to render_template("new")
    end
end
end


describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {"name"=>"Inox Screen", "address"=>"Pune", "city"=>"Pune"}
    }

    it "updates the requested screen" do
        screen = Screen.create! valid_attributes
        put :update, {:id => screen.to_param, :screen => new_attributes}
        screen.reload
    end

    it "assigns the requested screen as @screen" do
        screen = Screen.create! valid_attributes
        put :update, {:id => screen.to_param, :screen => valid_attributes}
        expect(assigns(:screen)).to eq(screen)
    end

    it "redirects to the screen" do
        screen = Screen.create! valid_attributes
        put :update, {:id => screen.to_param, :screen => valid_attributes}
        expect(response).to redirect_to(screen)
    end
end

context "with invalid params" do
  it "assigns the screen as @screen" do
    screen = Screen.create! valid_attributes
    put :update, {:id => screen.to_param, :screen => invalid_attributes}
    expect(assigns(:screen)).to eq(screen)
end

it "re-renders the 'edit' template" do
    screen = Screen.create! valid_attributes
    put :update, {:id => screen.to_param, :screen => invalid_attributes}
    expect(response).to render_template("edit")
end
end
end

describe "DELETE #destroy" do
    it "destroys the requested screen" do
      screen = Screen.create! valid_attributes
      expect {
        delete :destroy, {:id => screen.to_param}
        }.to change(Screen, :count).by(-1)
    end

    it "redirects to the screens list" do
      screen = Screen.create! valid_attributes
      delete :destroy, {:id => screen.to_param}
      expect(response).to redirect_to(screens_url)
  end
end


end