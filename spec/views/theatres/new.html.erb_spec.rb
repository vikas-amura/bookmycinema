require 'rails_helper'

RSpec.describe "theatres/new", type: :view do
  before(:each) do
    @user = User.last
    sign_in @user
    @theatre= Theatre.new(:name => "Vishal", :address => "swarget", :city => "pune")
  end

  it "renders new theatre form" do
    render

    assert_select "form[action=?][method=?]", theatres_path, "post" do

      assert_select "input#theatre_name[name=?]", "theatre[name]"

      assert_select "input#theatre_address[name=?]", "theatre[address]"

      assert_select "input#theatre_city[name=?]", "theatre[city]"

    end
  end
end
