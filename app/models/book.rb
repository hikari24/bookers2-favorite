class Book < ApplicationRecord
	belongs_to :user

	has_many :post_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy

	#いいねしているかどうか
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	# def favorite?(book, user)
	# 	book.favorites.find_by(user_id: user_id)
	# end

	def favorite_user(user_id)
		favorites.find_by(user_id: user_id)
	end
	#バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
	#presence trueは空欄の場合を意味する。
	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
end
