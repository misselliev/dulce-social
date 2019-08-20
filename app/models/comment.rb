class Comment < ApplicationRecord
  belongs_to :commenter, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  validates :content, presence: :true, length: {maximum: 500}
  validates :commenter_id, presence: :true
  validates :post_id, presence: :true
end
