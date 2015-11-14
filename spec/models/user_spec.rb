require 'rails_helper'

RSpec.describe User, :type => :model do


	let(:user){create(:user)}

	describe "is invalid without a --" do
		it "email" do
		user.email = nil
		expect(user).to be_invalid
		end

		it "username" do
		user.username = nil
		expect(user).to be_invalid
		end

		it "password" do
		user.password = nil
		expect(user).to be_invalid
		end
	end

	describe "encrypt password" do
		it "generates salt" do
		expect(user.password_salt).to be_present
		end

		it "generates hash" do
		expect(user.password_hash).to be_present
		end
	end

	describe ".authenticate" do
		context "if encrypt has run successfully" do
			it "returns user" do
				user.password_hash == BCrypt::Engine.hash_secret("pantspants",user.password_salt)
				expect(User.authenticate("pants@aol.com","pantspants")).to eq(user)
			end
		end

		context "if encrypt has FAILED" do
			it "does not return user" do
				# user.password_hash == "bollocks"
				create(:user, email: "dumb@aol.com", password: "not swag", password_confirmation: "not swag")
				expect(User.authenticate("dumb@aol.com","swag")).to eq(nil)
			end

		end
	end


	# end

end



