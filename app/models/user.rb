class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  has_many :posts, foreign_key: 'user_id', class_name: 'Post'
  has_many :comments, foreign_key: 'user_id', class_name: 'Comment'
  has_many :likes, foreign_key: 'user_id', class_name: 'Like'

  # validates
  validates :name, :bio, presence: true
  validates :email, uniqueness: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  ROLES = %I[admin defaut].freeze

  after_save :recent_posts

  def recent_posts
    posts.limit(3).order(created_at: :desc)
  end

  def is?(requested_role)
    ROLES == requested_role.to_s
  end
end
