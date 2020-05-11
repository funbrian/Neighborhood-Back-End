class User < ApplicationRecord
  has_secure_password
  
  validates :email, presence: true, uniqueness: true
  
  has_many :posts, primary_key: :id, foreign_key: :user_id

  has_many :likes, class_name: :Like, primary_key: :id, foreign_key: :user_id

  has_many :comments, class_name: :Comment, primary_key: :id, foreign_key: :user_id

  has_many :followed_users, foreign_key: :follower_id, class_name: :Follow
  has_many :followees, through: :followed_users
    
  has_many :following_users, foreign_key: :followee_id, class_name: :Follow
  has_many :followers, through: :following_users
  
  # belongs_to :username

  def not_following
    @following = self.followees
    @users = User.all
    @not_following = @users - @following
  end


end
