class Post < ActiveRecord::Base
# scope :starts_with_h, -> { where("body LIKE ?", "H%") }
#select * from posts where body like "p%"

	belongs_to :user
	has_many :comments

	validates :body, presence: true
	# before_create :mixxy

	# 	def mixxy
	# 		self.body = body + ":-)"	
	# 	end

	has_attached_file :milktar, styles:
	{ medium: "300x300>", thumb: "100x100>" }
	# ,default_url: "/images/:style/missing.png"
	
	validates_attachment_content_type :milktar,
	content_type: /\Aimage\/.*\Z/

end
