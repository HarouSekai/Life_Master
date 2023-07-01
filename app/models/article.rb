class Article < ApplicationRecord
  belongs_to :user

  validates :title, :summary, :user_id, presence: true
end
