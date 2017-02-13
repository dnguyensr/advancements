class Requirement < ApplicationRecord
  belongs_to :rank
  has_many :subrequirements
  validates :number, :description, :ranks_id, presence: true
end
