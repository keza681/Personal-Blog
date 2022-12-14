class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 200 }
  validates :comment_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :author, class_name: 'User'

  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end

  def update_posts_counter
    author.increment!(:post_counter)
  end
end
