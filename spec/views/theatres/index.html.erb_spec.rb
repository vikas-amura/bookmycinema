require 'rails_helper'

RSpec.describe "theatres/index", type: :view do
  before(:each) do
    @user = User.last
    sign_in @user
     @theatres = Theatre.paginate(:page => params[:page],:per_page=>10)
  end

  it "renders a list of theatre" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 0
    assert_select "tr>td", :text => "address".to_s, :count => 0
    assert_select "tr>td", :text => "city".to_s, :count => 0
    assert_select "tr>td", :text => 1.to_s, :count => 0
  end
end
