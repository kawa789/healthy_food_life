class Food < ApplicationRecord
  belongs_to :user, optional: true #投稿時にuserのnillを許可
  validates :title, presence: true
  validates :body, presence: true

  has_many :food_comments, dependent: :destroy
end
