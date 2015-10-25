class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.where(email: params[:email]).first
		if @user && @user.password == params[:password]
			session[:user_id] = @user.id
			flash[:notice] = "Successful Login" 
			redirect_to users_path
		else
			flash[:alert] = "Incorrect Login Info"
				render :new #renders page again
		end
	end

 	def destroy
 		session[:user_id] = nil
 		flash[:notice] = "You are now signed out"
 		redirect_to users_path
 	end
end
