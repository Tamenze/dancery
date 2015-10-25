class UsersController < ApplicationController

	def index
		if session[:user_id]
			@users = User.all
			# @users = User.with_email_andre 
				#testing scopes 
			# @users = User.with_special_name("badu")
		else
			flash[:alert] = "You must be logged in to view users."
			redirect_to login_path
		end		
	end

	def create
		# if User.find_by email: params[:user][:email]  
		#  	flash[:alert] = "This email address is already signed up for an account."
		# 	redirect_to login_path
		# elsif User.find_by username: params[:user][:username]
		# 	flash[:alert] = "That username is already in use, please select another."
		# 	redirect_to login_path
		# else
			# @user = User.create params[:user] 
			@user = User.new(params[:user])
			@user.save

				if @user.save
				#@user = User.create (user_params)  #trying out private method below
				redirect_to users_path
				else 
					render :new
				end
		end
	# end
		# @user=User.new
		# if @user.save 
		# 	flash[:notice] = "Your account was created successfully."
		# 	redirect_to user_path @user
		# else
		# 	flash[:alert] = "There was a problem saving your account."
		# 	redirect_to new_user_path
		# end
		#WHY NEW AND NOT CREATE? WOULDN'T I ALSO NEED A SAVE HERE?
	def new
		@user = User.new
	end

	def show
		@user = User.find params[:id]
	end
	def edit
    # finds user with id of params[:id]
    @user = User.find params[:id]
  	end

	def update
		@user = User.find params[:id]
		@user.update params[:user]
		redirect_to edit_user_path(@user)
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to users_path
	end

	private
	def user_params
		params.require(:user).permit(:email, :username, :password)
	end


end
