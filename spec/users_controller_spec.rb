require 'rails_helper'

RSpec.describe UsersController, :type => :controller do 
	let(:valid_session) do
		{user_id: 1}
	end

	# let (:invalid_session) do
	# 	{user_id: nil}
	# end

	let(:valid_attributes) do {
		email: "bali@aol.com ",
		username: "bali",
		password: "bali",
	}
	end

	let(:invalid_attributes) do {
		email: nil
	}
	end


	describe "GET index" do
		context "when user is signed in" do
			it "assigns all users as @users" do
			user = User.create! valid_attributes
			get :index, {}, valid_session
			expect(assigns(:users)).to eq([user])	
			end
		end
		context "when user is not signed in" do
			it "redirects to the login path" do
			get :index
			expect(response).to redirect_to(login_path)
			end
		end
	end

	describe "GET show" do 
		it "assigns the requested user as @user" do
		user = User.create! valid_attributes
		get :show, { id: user.id }, valid_session
		expect(assigns(:user)).to eq(user)
		end	
	end

	describe "GET new" do
		it "assigns a new user to @user" do
		get( :new, {}, valid_session)
		expect(assigns(:user)).to be_instance_of(User)
		end
	end

	describe "GET edit" do 
		it "assigns the requested user as user" do 
			user = User.create! valid_attributes
			get :edit, { id: user.id }, valid_session
			expect(assigns(:user)).to eq(user) 
		end
	end

	describe "DELETE destroy" do
		it "destroys the requested user" do
			user = User.create! valid_attributes
			delete :destroy, { id: user.id }, valid_session
			expect(User.find_by_id(user.id)).to eq(nil)
		end

		it "redirects to the users list" do
			user = User.create! valid_attributes
			delete :destroy, { id: user.id }, valid_session
			expect(response).to redirect_to(users_url)
		end
	end


	describe "POST create" do
		context "when valid attributes" do 
			it "creates the requested user" do
				post :create, { user: valid_attributes}, valid_session
				expect(User.find_by_email(valid_attributes[:email])).to be_present
			end

			it "assigns the requested user to @user" do
				post :create, { user: valid_attributes}, valid_session
				expect(assigns(:user)).to eq(User.find_by_email(valid_attributes[:email]))
			end

			it "redirects to specific user" do
				post :create, { user: valid_attributes}, valid_session
				expect(response).to redirect_to(users_path)
			end
		end
		context "when invalid attributes" do
			it "DOES NOT create the requested user" do
				post :create, { user: invalid_attributes }, valid_session
				expect(User.find_by_email(valid_attributes[:email])).to eq(nil)
			end
		
			it "redirects to new template" do
				post :create, { user: invalid_attributes }, valid_session
				expect(response).to redirect_to(new_user_path)
			end
		end

	end

end






