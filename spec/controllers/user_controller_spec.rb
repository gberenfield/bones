require 'spec_helper'

describe UsersController do
  fixtures :all
  
  def mock_user(stubs={})
    @mock_user ||= mock_model(User, stubs).as_null_object
  end
  
  before {    
    @user  = User.make(:admin)
    sign_in @user    
  }

  it "should prevent non-admins from getting on user page" do
    user = User.make
    sign_in user
    get "index"
    request.flash[:error].should include("You must be an Administrator to access this page")
    response.should redirect_to(root_path)
  end
  
  it "should show index" do
    get "index"
    response.should be_success
  end

  it "should show a user" do
    User.stub(:find).and_return(u=mock_user(:id=>"37"))
    get :show, :id => u.id
    response.should render_template(:show)    
  end

  it "should let me enter a new one" do
    get 'new'
    response.should be_success
  end
  
  it "should let me edit a user" do
    User.stub(:find).and_return(u=mock_user(:id=>"37"))
    get :edit, :id => "37"
    response.should render_template(:edit)
  end
  
  it "should let me create a new user when all data valid" do
    User.stub(:find).and_return(u=mock_user(:id=>"37"))
    User.stub(:new).and_return(u)
    post 'create'
    request.flash[:notice].should include("Successfully created user.")
  end
  
  it "should update successfully" do
    User.stub(:find).and_return(u=mock_user(:id=>"37"))
    put :update, :id => "37",:user=>{:login=>"newloginhere",:password=>""}
    response.should redirect_to(user_url(assigns[:user]))
  end

  it "should NOT update successfully when data invalid" do
    User.stub(:find).and_return(u=mock_user(:id=>"37",:update_attributes=>false))
    put :update , :id => "37",:user=>{:login=>"newloginhere",:password=>""}
    response.should render_template(:edit)
  end
  
  it "should destroy a user successfully" do
    User.stub(:find).and_return(u=mock_user(:id=>"37"))
    delete :destroy, :id => "37"
    User.exists?("37").should be_false
  end
  

end