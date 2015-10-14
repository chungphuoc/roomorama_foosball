require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'association' do
    # have many relation
    it { should have_many(:team_users)}
  end
end
