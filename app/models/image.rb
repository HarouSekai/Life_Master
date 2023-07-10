class Image < ApplicationRecord
  belongs_to :paragraph
  has_one_attached :image
  validates :paragraph_id, presence: true
end
