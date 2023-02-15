class Book < ApplicationRecord

  has_one_attached :image
  belongs_to :user
  #has_many :favorites, dependent: :destroy
  #has_many :post_comments, dependent: :destroy


  validates :title, presence: true
  validates :body, presence: true


end
