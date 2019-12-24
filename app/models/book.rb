class Book < ApplicationRecord

   validates :title, presence: true, uniqueness: {case_sensitive: false}
   validates :author_first_name, presence: true
   validates :author_last_name, presence: true

  has_many :reviews
  has_many :users, through: :reviews

  accepts_nested_attributes_for :reviews
  
  scope :order_by_title, -> {order(title: :asc)}

  


end
