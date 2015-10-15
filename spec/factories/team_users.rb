FactoryGirl.define do
  factory :team_user do
    team { FactoryGirl.create(:team) }
    user { FactoryGirl.create(:user) }
  end

end
