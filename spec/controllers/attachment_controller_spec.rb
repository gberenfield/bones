# require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require 'spec_helper'

describe AttachmentsController do

  before {
    @user  = User.make(:admin)
    @user2 = User.make
    session[:user_id]=1  # ok! This is all that's necessary to get the :before_filter and authorize() to pass so acts like I'm "logged in" 
  }

  it "should show an Attachment" do
    attachment=Attachment.make
    # puts "The attahcment ID is: #{(attachment.id).to_s}"
    # attachment = stub_model(Attachment)
    # Attachment.stub(:find).with("37") { attachment }
    # get :show, :id => "37"
    get :show, :id=>attachment.id
    response.should render_template(:show)
    # assigns(:attachment).should eq(attachment)
  end

  # it "should let me enter a new one" do
  #   session[:username]=User.first.username
  #   get 'new',:Attachment=>Attachment.first.id
  #   response.should be_success
  # end
  # 
  # it "should let me edit a Attachment" do
  #   get :edit, :id => Attachment.first
  #   response.should render_template(:edit)
  # end
  # 
  # it "should let me create a new Attachment when all data valid" do
  #   mycr={:user_id=>User.first.id,:givenname=>"bob",:sn=>"jones",:l=>"city",:st=>"state"}
  #   post 'create',:Attachment=>mycr
  #   response.should render_template(:show)
  # end
  # 
  # it "should NOT let me create a new Attachment when all data NOT valid" do
  #   Attachment.any_instance.stubs(:save).returns(false)
  #   mycr={:user_id=>User.first.id,:givenname=>"bob",:sn=>"jones",:l=>"city",:st=>"state"}
  #   put 'create',:Attachment=>mycr
  #   response.should render_template(:new)    
  # end
  # 
  # it "should update successfully" do
  #   Attachment.stubs(:valid?).returns(true)
  #   put :update, :id => Attachment.first
  #   response.should render_template(:show)
  # end
  # 
  # it "should be UNsuccessful updating an invalid Attachment" do
  #   Attachment.any_instance.stubs(:save).returns(false)
  #   put :update, :id => Attachment.first,:Attachment=>{:user_id=>nil}
  #   response.should render_template(:edit)
  # end
  # 
  # it "should destroy a Attachment successfully" do
  #   cr=Attachment.first
  #   delete :destroy, :id => cr.id
  #   response.should redirect_to(Attachments_url)
  #   Attachment.exists?(cr.id).should be_false
  # end
  # 
end