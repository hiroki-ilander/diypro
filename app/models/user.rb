class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true
  
  has_one_attached :image
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
   has_many :posts, dependent: :destroy
   has_many :comments
   has_many :likes, dependent: :destroy
   has_many :liked_posts, through: :likes, source: :post
   
   def already_liked?(post)
     self.likes.exists?(post_id: post.id)
   end
end
