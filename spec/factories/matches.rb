FactoryGirl.define do
  factory :match do
    team_1_id { FactoryGirl.create(:team).id }
    team_2_id { FactoryGirl.create(:team).id }
  end

end
