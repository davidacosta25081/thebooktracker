class Book < ApplicationRecord

  validates :title, presence: true

  has_many :reviews
  has_many :users, through: :reviews
  belongs_to :genre
  accepts_nested_attributes_for :reviews
  

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end
 
  def genre_name
    self.genre ? self.genre.name : nil
  end


end
