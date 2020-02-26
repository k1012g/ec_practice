class Item < ApplicationRecord
	belongs_to :user
	belongs_to :category
	belongs_to :brand
	has_many :comments
	has_many :favorites

	attachment :item_image

	def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end
end
