class User < ActiveRecord::Base
# scope :with_email_andre, -> { 
# 	where(email: "andre@gmail.com") 
# }
# scope :with_special_name, lambda { |name| where(username: name) }
	
	has_many :posts
	has_many :comments

	validates_presence_of :email, :username, :password
	#works everytime you save email to db (so creating and updating)
	validates :email, uniqueness: true
	validates :username, uniqueness: true
	validates :password, confirmation: true, presence: true
	validates :username, length: {in: 6..30}
	validates :password, length: {in: 6..30}
end
