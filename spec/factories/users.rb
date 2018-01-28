FactoryBot.define do
  factory :user, :class => 'User' do
    first_name "Boy"
    last_name "Scout"
    email 'boy@scout.com'
    password 'password'
    password_confirmation 'password'
  end
end
