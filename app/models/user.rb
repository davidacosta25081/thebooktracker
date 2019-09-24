class User < ApplicationRecord

  validates :name, presence: true
  validates :password, presence: true

  has_secure_password

  has_many :reviews
  has_many :books, through: :reviews


end
