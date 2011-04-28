require 'spec_helper'

describe DocumentsController do

  before {
    @user  = User.make
    sign_in @user
  }

  def mock_document(stubs={})
    @mock_document ||= mock_model(Document, stubs).as_null_object
  end

  it "should show index" do
    get "index"
    response.should be_success
  end

  it "should show an Document" do
    Document.stub(:find) { mock_document(:id=>"37") }
    get :show, :id=>"37"
    response.should render_template(:show)
  end

  it "builds json from queried jqgrid data for jqgrid" do
    3.times { Document.make }
    xhr :get, :grid, {:_search=>true,:nd=>1281391842592,:rows=>5,:page=>1,:sidx=>'document_file_name',:sord=>'asc'}
    response.should be_success
  end

  it "filters grid data from jqgrid params" do
    3.times { Document.make }
    xhr :get, :grid, {:_search=>false,:nd=>1281391842592,:description=>'ab',
      :rows=>5,:page=>1,:sidx=>'document_file_name',:sord=>'asc'}
    response.should be_success
  end

  it "should let me enter a new one" do
    session[:username]=User.first.login
    get 'new'
    response.should be_success
  end
  
  it "should let me edit a Document" do    
    Document.stub(:find) { mock_document(:id=>"37") }
    get :edit, :id => "37"
    response.should render_template(:edit)
  end
  
  it "should let me create a new Document when all data valid" do
    Document.stub(:new) { mock_document(:save=>true) }
    post 'create'
    response.should redirect_to(document_url(assigns[:document]))
  end
  
  it "should NOT let me create a new Document when all data NOT valid" do
    Document.stub(:new) { mock_document(:save => false) }
    put 'create',:Document=>{}
    response.should render_template(:new)    
  end
  
  it "should update the document" do
    Document.stub(:find).and_return { mock_document(:update_attributes => true) }
    put :update, :id => "37",:document=>{:description=>"new description here"}
    response.should redirect_to(document_url(assigns[:document]))
  end
  
  
  it "should be UNsuccessful updating an invalid Document" do
    Document.stub(:find).and_return { mock_document(:update_attributes => false) }
    put :update, :id => "37",:Document=>{:user_id=>nil}
    response.should render_template(:edit)
  end
  
  it "should let me updategrid ok" do
    Document.stub(:find).and_return { mock_document(:update_attributes => true) }
    get 'updategrid',:document_file_name=>"a file anew"
    response.should be_success
  end
  
  it "should destroy a Document successfully" do
    Document.stub(:find) { mock_document(:id=>"37",:update_attributes=>true) }
    delete :destroy, :id => "37"
    response.should redirect_to(documents_url)
    Document.exists?("37").should be_false
  end
   
end