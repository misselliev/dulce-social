class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, foreign_key: :commenter_id, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :content, presence: :true, length: {maximum: 500}
end
