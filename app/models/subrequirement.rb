class Subrequirement < ApplicationRecord
  belongs_to :requirement
  validates :part, :description, :requirement_id, presence: true
end
