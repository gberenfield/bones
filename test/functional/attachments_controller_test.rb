require 'test_helper'

class AttachmentsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Attachments.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Attachments.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Attachments.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to attachments_url(assigns(:attachments))
  end
  
  def test_edit
    get :edit, :id => Attachments.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Attachments.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Attachments.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Attachments.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Attachments.first
    assert_redirected_to attachments_url(assigns(:attachments))
  end
  
  def test_destroy
    attachments = Attachments.first
    delete :destroy, :id => attachments
    assert_redirected_to attachments_url
    assert !Attachments.exists?(attachments.id)
  end
end
