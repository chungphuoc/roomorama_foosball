require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'association' do
    # have many relation
    it { should have_many(:team_users)}
  end

  describe 'validation' do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
  end

  describe 'custom methods' do
    let (:team_1) { FactoryGirl.create(:team) }
    let (:user_1) { FactoryGirl.create(:user) }
    let (:team_user_1) { FactoryGirl.create(:team_user, user: user_1, team: team_1) }

    let (:team_2) { FactoryGirl.create(:team) }
    let (:user_2) { FactoryGirl.create(:user) }
    let (:team_user_2) { FactoryGirl.create(:team_user, user: user_2, team: team_2) }
    let (:match) { FactoryGirl.create(:match, team_1_id: team_1.id, team_2_id: team_2.id) }
    let (:match_result_win) { FactoryGirl.create(:match_result, match: match, team: team_1, result: MatchResult::RESULT_WIN) }
    let (:match_result_loss) { FactoryGirl.create(:match_result, match: match, team: team_2, result: MatchResult::RESULT_LOSE) }

    it 'return correct value of all custom function wins, loss, total_matches, percent_win' do
      team_user_1
      team_user_2
      match_result_win
      match_result_loss
      expect(user_1.total_matches).to eq 1
      expect(user_1.wins).to eq 1
      expect(user_1.loss).to eq 0
      expect(user_1.percent_win).to eq 100.0

      expect(user_2.total_matches).to eq 1
      expect(user_2.wins).to eq 0
      expect(user_2.loss).to eq 1
      expect(user_2.percent_win).to eq 0.0
    end
  end
end
