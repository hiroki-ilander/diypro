class Post < ApplicationRecord
    belongs_to :user
    validates :title,  presence: true
    validates :introduction, presence: true
    
    has_one_attached :image
end
