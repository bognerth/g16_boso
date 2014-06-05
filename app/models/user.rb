class User < ActiveRecord::Base
  include Adauth::Rails::ModelBridge
  attr_accessible :login, :firstname, :lastname, :email, :group_strings, :admin, :edit

  AdauthMappings = { :login => :login, :firstname => :first_name, :lastname => :last_name }
  AdauthSearchField = [:login, :login]

end
