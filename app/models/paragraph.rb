class Paragraph < ApplicationRecord
  belongs_to :article
  has_many :images
  validates :article_id, presence: true
end
