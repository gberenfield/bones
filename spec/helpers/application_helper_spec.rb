require 'spec_helper'

describe ApplicationHelper do

  it "should return true for admins" do
    @user  = User.make(:admin)
    sign_in @user    

    helper.stub(:current_user).and_return(@user)

    helper.is_admin.should be_true
  end

  it "should return true for editors" do
    @user  = User.make(:editor=>true)
    sign_in @user    

    helper.stub(:current_user).and_return(@user)

    helper.is_editor.should be_true
  end

end