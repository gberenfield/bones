require 'spec_helper'

describe User do
  it "should raise an error for passwords <4 characters" do
    expect do
      User.create!(:login=>"test",:email=>"test@tester.org",:password=>"gas",:password_confirmation=>"gas")
    end.to raise_error(/Password is too short/)
  end
  
  it "should raise an error for passwords >20 characters" do
    expect do
      User.create!(:login=>"test",:email=>"test@tester.org",:password=>"windbagwindbagwindbag",:password_confirmation=>"windbagwindbagwindbag")
    end.to raise_error(/Password is too long/)
  end

  it "should raise an error for no email characters" do
    expect do
      User.create!(:login=>"tester",:password=>"hope",:password_confirmation=>"hope")
    end.to raise_error(/Email can't be blank/)
  end
  
end
