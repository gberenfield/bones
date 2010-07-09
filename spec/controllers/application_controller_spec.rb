require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ApplicationController do
  # fixtures :all
  
  before {
    @user  = User.make(:admin)
    @user2 = User.make
  }

  
end