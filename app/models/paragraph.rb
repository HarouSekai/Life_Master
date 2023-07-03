class Paragraph < ApplicationRecord
  belongs_to :article
  has_many :images, dependent: :destroy
  validates :article_id, presence: true
end
