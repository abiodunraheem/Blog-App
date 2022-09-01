class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  has_many :posts, class_name: 'Post', foreign_key: 'users'
  has_many :comments, class_name: 'Comment', foreign_key: 'users'
  has_many :likes, class_name: 'Like'

  # validates
  validates :name, :bio, presence: true
  validates :email, uniqueness: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_posts
    posts.limit(3).order(created_at: :desc)
  end
end
