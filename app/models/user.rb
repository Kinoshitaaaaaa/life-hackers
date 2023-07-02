class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :user_name, length: { minimum: 2, maximum: 20}
  validates :user_name, uniqueness: true
  validates :introduction, length: {maximum: 50}

  def self.looks(search, word)
    if search == "perfect_match"
      @user = User.where("user_name LIKE?", "#{word}")
    elsif search == "forward_match"
      @user = User.where("user_name LIKE?","#{word}%")
    elsif search == "backward_match"
      @user = User.where("user_name LIKE?","%#{word}")
    elsif search == "partial_match"
      @user = User.where("user_name LIKE?","%#{word}%")
    else
      @user = User.all
    end
  end

  def get_profile_image(width, height)
   unless profile_image.attached?
     file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
     profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
   end
   profile_image.variant(resize_to_limit: [width, height]).processed
  end



end
