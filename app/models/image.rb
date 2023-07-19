class Image < ApplicationRecord
  belongs_to :paragraph
  has_one_attached :image
  validates :image, presence: {message: 'をアップロードしてください'}
  validates :paragraph_id, presence: {message: 'を作成してください'}
end
