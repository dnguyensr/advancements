require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_one(:advancement) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }

  it "has a name consisting of first name and first initial of last name" do
    user = User.new(first_name: "Boy", last_name: "Scout")
    expect(user.name).to eq("Boy S")
  end
end
