require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'association' do
    # have many relation
    it { should have_many(:match_games) }
  end
end
