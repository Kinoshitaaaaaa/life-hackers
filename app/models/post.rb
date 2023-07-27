class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_one_attached :image
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

with_options presence: true, on: :publicize do
  validates :title
  validates :body
  validates :genre_id

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

  def get_image(width, height)
   unless image.attached?
     file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
     image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
   end
    image.variant(resize_to_limit: [width, height]).processed
  end

end
