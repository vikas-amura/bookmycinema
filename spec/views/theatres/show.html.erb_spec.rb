require 'rails_helper'

RSpec.describe "theatres/show", type: :view do
  before(:each) do
  @user = User.last
  sign_in @user
  @theatre= Theatre.last
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/City/)
  end
end
