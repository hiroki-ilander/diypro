class Post < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :likes
    has_many :liked_users, through: :likes, source: :user
    
    validates :title,  presence: true
    validates :image, presence: true
    
    has_one_attached :image
    
    def self.search(search)
      if search != ""
        Post.where('title LIKE(?)', "%#{search}%")
      else
        Post.includes(:user).order("created_at DESC")
      end
    end
end