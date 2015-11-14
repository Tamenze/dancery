FactoryGirl.define do
	factory :post do
		body "And what a body it is, ooh ooh. Joni Mitchell never lie."
		association :user, factory: :user, email: "pants@aol.com"
	end
end