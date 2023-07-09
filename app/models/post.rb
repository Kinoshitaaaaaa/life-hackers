class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

with_options presence: true, on: :publicize do
  validates :title
  validates :body
  validates :body
  validates :genre_id
  validates :image
end
validates :title, length: { maximum: 30 }, on: :publicize
validates :body, length: { maximum: 500 }, on: :publicize


  def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @post = Post.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @post = Post.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @post = Post.where("title LIKE?","%#{word}%")
    else
      @post = Post.all
    end
  end

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end


end
