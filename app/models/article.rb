class Article < ApplicationRecord
  belongs_to :user
  has_many :paragraphs

  validates :title, :summary, :user_id, presence: true
end
