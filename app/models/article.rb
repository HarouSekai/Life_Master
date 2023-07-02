class Article < ApplicationRecord
  belongs_to :user
  has_many :paragraphs, dependent: :destroy

  validates :title, :summary, :user_id, presence: true
end
