class Post < ApplicationRecord
    belongs_to :user
    has_many :comments
    validates :title,  presence: true
    validates :image, presence: true
    
    has_one_attached :image
end
