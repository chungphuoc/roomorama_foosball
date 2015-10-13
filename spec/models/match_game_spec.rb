require 'rails_helper'

RSpec.describe MatchGame, type: :model do
  describe 'association' do
    # belong to relation
    it { should belong_to(:game) }
    it { should belong_to(:match) }
  end
end
