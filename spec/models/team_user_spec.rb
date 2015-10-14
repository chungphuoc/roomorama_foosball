require 'rails_helper'

RSpec.describe TeamUser, type: :model do
  describe 'association' do
    # belong to relation
    it { should belong_to(:team) }
    it { should belong_to(:user)}
  end
end
