class Post < ActiveRecord::Base
# scope :starts_with_h, -> { where("body LIKE ?", "H%") }
#select * from posts where body like "p%"

	belongs_to :user
	has_many :comments

	before_create :mixxy

		def mixxy
			self.body = body + ":-)"	
		end
end
