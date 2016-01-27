require 'rails_helper'

RSpec.describe "theatres/edit", type: :view do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @user.confirm!
    sign_in @user
    @theatre =FactoryGirl.create(:theatre)
  end

  it "renders the edit theatre form" do
    render

    assert_select "form[action=?][method=?]", theatre_path(@theatre), "post" do

      assert_select "input#theatre_name[name=?]", "theatre[name]"

      assert_select "input#theatre_address[name=?]", "theatre[address]"

      assert_select "input#theatre_city[name=?]", "theatre[city]"

    end
  end
end
