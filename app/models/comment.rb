class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :commenter, class_name: 'User'

  validates :content, presence: :true, length: {maximum: 500}
  validates :commenter_id, presence: :true
  validates :post_id, presence: :true
end
