class Post < ApplicationRecord
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  belongs_to :author, class_name: 'User'
  belongs_to :user, foreign_key: 'author_id'

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_create :increment_post_counter
  before_validation :initialize_counters

  def create_like(user)
    likes.create(user:)
  end

  def five_recent_comments
    Comment.where(post_id: id).order(created_at: :desc).limit(5)
  end

  def increment_post_counter
    puts 'Incrementing posts counter'
    author.increment!(:posts_counter)
  end

  def all_posts
    Comment.where(post_id: id).order(created_at: :desc)
  end

  def all_comments
    comments.order(created_at: :desc)
  end

  private

  def initialize_counters
    self.comments_counter ||= 0
    self.likes_counter ||= 0
  end
end
