class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
  validates :body, length: {maximum: 500}
  validates :genre_id, presence: true
  validates :image, presence: true

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end


end
