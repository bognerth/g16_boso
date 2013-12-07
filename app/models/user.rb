class User < ActiveRecord::Base
  attr_accessible :admin, :edit, :email, :firstname, :lastname, :password, :password_confirmation
  has_secure_password
  validates_uniqueness_of :email
end
