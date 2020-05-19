class Like < ApplicationRecord
  
  validates :post, :user, presence: true

  validates_uniqueness_of :post_id, :scope => [:user_id]

  belongs_to :post

  belongs_to :user, class_name: :User, primary_key: :id, foreign_key: :user_id

end
