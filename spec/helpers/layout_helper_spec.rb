require 'spec_helper'

describe LayoutHelper do

  it "title to pass a content_for block" do
    @user  = User.make(:admin)
    sign_in @user    
    helper.should_receive :content_for,:title => "this is my title"
    helper.title("this is my title")
  end
  
  it "has show_title? return the instance value of @show_title" do
    @show_title = true
    helper.show_title?.should be_true
    @show_title = false
    helper.show_title?.should be_false
  end
  
  it "puts css stylesheets in <head> via stylesheet()" do
    helper.should_receive :content_for, :args=>"screen"
    helper.stylesheet("screen")
  end

  it "puts js scripts in <head> via javascript()" do
    helper.should_receive :content_for, :args=>"rails"
    helper.javascript("rails")
  end

end