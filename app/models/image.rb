class Image < ApplicationRecord
  belongs_to :paragraph
  validates :paragraph_id, presence: true
end
