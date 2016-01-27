require 'rails_helper'
include Devise::TestHelpers

RSpec.describe UsersController, :type => :controller do
  	  let(:user) {FactoryGirl.create(:user)}

    before(:each) do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        user.confirm!
        sign_in user
    	end

     it "should have a current_user" do
         expect(subject.current_user).not_to be_nil
      end

    describe "route tests" do

    end

end