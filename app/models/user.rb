class User < ApplicationRecord
    has_many :posts, foreign_key: :author_id, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
  
    # A method to return the 3 most recent posts for a user
    def recent_posts
      posts.order(created_at: :desc).limit(3)
    end
  end
  