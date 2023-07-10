class Image < ApplicationRecord
  belongs_to :paragraph
  has_one_attached :image
  validates :image, :paragraph_id, presence: true
end
