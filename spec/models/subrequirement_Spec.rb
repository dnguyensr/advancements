require 'rails_helper'

RSpec.describe Subrequirement, type: :model do
  it { should belong_to(:requirement) }
  it { should validate_presence_of(:part) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:requirement_id) }
end
