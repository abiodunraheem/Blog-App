class Post < ApplicationRecord
  belongs_to :user, class name 'User'
  has_many :comments, class name 'Comment'
  has_many :likes, class name 'Like'
end
