class UsersController < ApplicationController

  before_filter :require_admin
  
  def index
    @hide_dynamic=false
    @users = User.all
  end
  
  def show
    @hide_dynamic=true
    @user = User.find(params[:id])
  end
  
  def new
    @hide_dynamic=true
    @user = User.new
  end
  
  def create
    @hide_dynamic=true
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Successfully created user."
      redirect_to @user
    else
      render :action => 'new'
    end
  end
  
  def edit
    @hide_dynamic=true
    @user = User.find(params[:id])
  end
  
  def update
    @hide_dynamic=true
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated user."
      redirect_to @user
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @hide_dynamic=true
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Successfully destroyed user."
    redirect_to users_url
  end
end
