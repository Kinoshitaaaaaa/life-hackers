class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true
  validates :body, length: {maximum: 200}
  validates :genre, presence: true
end
