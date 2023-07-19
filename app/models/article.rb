class Article < ApplicationRecord
  belongs_to :user
  has_many :paragraphs, dependent: :destroy

  validates :title, :summary, presence: true
  validates :user_id, presence: {message: 'を新規登録してください'}
end
