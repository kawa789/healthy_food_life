class Food < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true

  has_many :food_comments, dependent: :destroy
end
