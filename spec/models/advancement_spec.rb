require 'rails_helper'

RSpec.describe Advancement, type: :model do
  it { should belong_to(:user) }
  it { should validate_presence_of(:user_id) }
  it { should validate_uniqueness_of(:user_id) }
  it { should have_many(:ranks) }
end
