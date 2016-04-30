class Comment < ActiveRecord::Base
	belongs_to :concert
	validates :email, :comment, presence: true
end
