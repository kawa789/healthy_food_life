class Food < ApplicationRecord
  belongs_to :user, optional: true #投稿時にuserのnillを許可
  validates :title, presence: true
  validates :body, presence: true

  has_many :food_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists? #引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べる
  end
end
