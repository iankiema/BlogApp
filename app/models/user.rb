class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comment
  has_many :like, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post

  validates :name, presence: true
  validates :posts_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def three_recent_posts
    Post.where(author: self).order(created_at: :desc).first(3)
  end

  def update_posts_counter
    update(posts_counter: posts.count)
  end
end
