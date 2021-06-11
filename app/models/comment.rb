class Comment < ApplicationRecord
  belongs_to :post, counter_cache: :comments_count
  belongs_to :user

  validates :content, length: { minimum: 10 }
end
