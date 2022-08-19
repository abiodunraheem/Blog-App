class User < ApplicationRecord
    has_many :posts, class name 'Post'
    has_many :likes, class name 'Like'
    has_many :comments, class name 'Comment'
end
