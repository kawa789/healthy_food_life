class Food < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  
  has_many :food_comments, dependent: :destroy
end
