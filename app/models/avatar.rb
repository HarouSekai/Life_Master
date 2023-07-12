class Avatar < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar
  validates :avatar, :user_id, presence: true
end
