require 'spec_helper'

describe ApplicationController do
  
  before {
    @user  = User.make(:admin)
    @user2 = User.make
  }

it "boots out non-admins handily if an admin is required" do
  # ac = ApplicationController.new
  sign_in @user2
  # controller.send(:require_admin)
  # request.flash[:error].should include("You must be an Administrator to access this page")
  # response.should redirect_to(root_path)
end
  
end