class Advancement < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true, uniqueness: true
  has_many :ranks
end
