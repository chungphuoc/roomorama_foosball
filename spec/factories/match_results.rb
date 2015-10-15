FactoryGirl.define do
  factory :match_result do
    team { FactoryGirl.create(:team) }
    match
    result 'Win'
  end

end
