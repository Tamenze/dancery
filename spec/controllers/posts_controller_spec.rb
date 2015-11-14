require 'rails_helper'

RSpec.describe PostsController, :type => :controller do
	let (:valid_session)do
		{user_id: 47}
	end

	let (:valid_attributes) do {
		body: "And what a body it is, ooh ooh. Joni Mitchell never lie.",
		user_id: 47
		}
	end

	let (:invalid_attributes) do {
		body: nil,
		user_id: 47
	}	
	end

		let(:fuck){ create(:post) }
		# let (:post)()


	describe "GET index" do 
		context "user is signed in and requests index" do
			it "assigns all posts as @posts" do
				# post = Post.create! valid_attributes
				get :index, {}, valid_session
				expect(assigns(:posts)).to eq([fuck])
			end
		end

		context "user is NOT signed in and requests index" do
			it "redirects user to login path" do
				get :index, {}
				expect(response).to redirect_to(login_path)
			end
		end

	end

	describe "GET new" do
		context "user is signed in and makes new post" do
			it "assigns a new post as @post" do
				get :new, {}, valid_session
				expect(assigns(:post)).to be_instance_of(Post)
			end
		end

		context "user is NOT signed in and TRIES to make new post" do
			it "redirects user to login path" do
				get :new, {}
				expect(response).to redirect_to(login_path)
			end
		end
	end

	describe "GET show" do
		it "assigns the requested post as @post" do
			# post = Post.create! valid_attributes
			get :show, { id: fuck.id }, valid_session
			expect(assigns(:post)).to eq(fuck)
		end
	end

	describe "POST create" do
	 	context "when body is not empty" do
	 		it "creates the requested post" do
	 			xhr :post, :create, {post: valid_attributes}, valid_session
	 			expect(Post.find_by(user_id: valid_session[:user_id])).to be_present
	 		end

	 		it "assigns the requested post to @post" do
	 			xhr :post, :create, {post: valid_attributes}, valid_session
	 			expect(assigns(:post)).to eq(Post.find_by(user_id: valid_session[:user_id]))
	 		end
	 		it "redirects to all posts" do
	 			xhr :post, :create, {post: valid_attributes}, valid_session
	 			expect(response).to redirect_to(posts_path)
	 		end
	 	end
	 	context "when body is empty" do
	 		it "does not create the requested post" do
	 			xhr :post, :create, {post: invalid_attributes}, valid_session
	 			expect(Post.find_by(user_id: valid_session[:user_id])).to eq(nil)
	 		end
		end
	end

	# describe "POST update" do
	# end

	describe "DELETE destroy" do
		it "destroys the requested post" do
		xhr :delete, :destroy, { id: fuck.id }, valid_session
		expect(Post.find_by(user_id: valid_session[:user_id])).to eq(nil)
		end

		it "redirects to the user path" do
		xhr :delete, :destroy, { id: fuck.id }, valid_session
		expect(response).to redirect_to(posts_path)
		end

	end




end
