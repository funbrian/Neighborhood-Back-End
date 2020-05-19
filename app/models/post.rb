class Post < ApplicationRecord
  
  belongs_to :user

  belongs_to :username

  has_many :likes

  has_many :comments

  # def post_username
  #   @posts.each do |post|
  #     post.username = post.user.username
  #   end
  # end

end
