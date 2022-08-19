class Comment < ApplicationRecord
  belongs_to :user, class name 'User'
  belongs_to :post, class name 'Post'
end
