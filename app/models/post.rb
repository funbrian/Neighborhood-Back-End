class Post < ApplicationRecord
  
  belongs_to :user

  # belongs_to :username

  has_many :likes, class_name: :Like, primary_key: :id, foreign_key: :post_id

  has_many :comments, class_name: :Comment, primary_key: :id, foreign_key: :post_id

  # def post_username
  #   @posts.each do |post|
  #     post.username = post.user.username
  #   end
  # end

end
