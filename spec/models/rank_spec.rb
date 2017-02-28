require 'rails_helper'

RSpec.describe Rank, type: :model do
  it { should belong_to(:advancement) }
  it { should have_many(:requirements) }
  it { should validate_presence_of(:rank) }
  it { should validate_presence_of(:advancement_id) }
end
