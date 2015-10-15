require 'rails_helper'

RSpec.describe MatchResult, type: :model do
  describe 'association' do
    # belong to relation
    it { should belong_to(:match) }
    it { should belong_to(:team) }
  end
end
