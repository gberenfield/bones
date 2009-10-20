class User < ActiveRecord::Base

  acts_as_authentic 

  validates_presence_of :login, :crypted_password, :password_salt
  validates_uniqueness_of :login

  attr_accessor :password_confirmation
  validates_confirmation_of :password

end
