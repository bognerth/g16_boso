class SessionsController < ApplicationController
	def new
		redirect_to root_path if current_user
	end

	def create
		ldap_user = Adauth.authenticate(params[:username], params[:password])
		if ldap_user
        	user = User.return_and_create_from_adauth(ldap_user)
        	session[:user_id] = user.id
        	redirect_to root_path
    	else
        	redirect_to root_path, :error => "Invalid Login"
    	end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path
	end
end