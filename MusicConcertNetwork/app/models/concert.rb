class Concert < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :artist, :venue, :city, :date, :price, :description, presence: true

  def self.mostCommentedConcerts
    concerts = all
    concerts.sort{ |a, b| b.comments.count <=> a.comments.count }
    concerts.limit(10)
  end
end
