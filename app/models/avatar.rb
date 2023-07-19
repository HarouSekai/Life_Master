class Avatar < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar
  validates :avatar, presence: {message: 'をアップロードしてください'}
  validates :user_id, presence: {message: 'を新規登録してください'}
end
