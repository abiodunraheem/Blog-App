class Like < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  after_save :update_likes_counter

  # validations
  validates :user_id, presence: true
  validates :post_id, presence: true

  def update_likes_counter
    post.increment!(:likes_counter)
  end
end
