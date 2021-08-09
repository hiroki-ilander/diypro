class Post < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :likes
    has_many :liked_users, through: :likes, source: :user
    
    validates :title,  presence: true
    validates :image, presence: true
    
    has_one_attached :image
end
# 