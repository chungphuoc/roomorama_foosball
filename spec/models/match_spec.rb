require 'rails_helper'

RSpec.describe Match, type: :model do
  describe 'association' do
    # have many relation
    it { should have_many(:match_games) }
    # belong to relation
    it { should belong_to(:team_1) }
    it { should belong_to(:team_2) }
  end
end
