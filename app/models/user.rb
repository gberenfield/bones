class User < ActiveRecord::Base

  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :login, :email, :password, :password_confirmation, :admin, :editor
end
