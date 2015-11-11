class User < ActiveRecord::Base
	# has_secure_password
	# validates_confirmation_of :password
	# validates_presence_of :password, on: :create


	attr_accessor :password
	validates_confirmation_of :password
	before_save :encrypt_password


	def encrypt_password
		self.password_salt = BCrypt::Engine.generate_salt
		self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
	end

	def self.authenticate(email,password)
	user = User.where(email: email).first
		if user && user.password_hash == BCrypt::Engine.hash_secret(password,user.password_salt)
		user
		else
		nil
		end
	end

# scope :with_email_andre, -> { 
# 	where(email: "andre@gmail.com") 
# }
# scope :with_special_name, lambda { |name| where(username: name) }
	
	# has_many :posts
	# has_many :comments

	validates_presence_of :email, :username, :password
	# #works everytime you save email to db (so creating and updating)
	# validates :email, uniqueness: true
	validates :username, uniqueness: true
	# validates :password, confirmation: true, presence: true
	# validates :username, length: {in: 6..30}
	# validates :password, length: {in: 6..30}

	has_attached_file :avatar, :styles =>
	{ :medium => "300x300>", :thumb => "100x100>" },
	:default_url => "/images/:style/missing.png"
	
	validates_attachment_content_type :avatar,
	:content_type => /\Aimage\/.*\Z/
end
