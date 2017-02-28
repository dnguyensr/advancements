require 'rails_helper'

RSpec.describe Requirement, type: :model do
  it { should belong_to(:rank) }
  it { should have_many(:subrequirements) }
  it { should validate_presence_of(:number) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:rank_id) }
end
