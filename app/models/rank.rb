class Rank < ApplicationRecord
  belongs_to :advancement
  # has_many :requirements
  validates :rank, :advancement_id, presence: true
  # validates :rank, uniqueness: {scope: :user, message: "User already has rank"}
end
