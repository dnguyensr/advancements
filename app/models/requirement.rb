class Requirement < ApplicationRecord
  belongs_to :rank
  has_many :subrequirements
  validates :number, :description, :rank_id, presence: true
end
