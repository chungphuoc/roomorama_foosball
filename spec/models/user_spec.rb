require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'association' do
    # belong to relation
    it { should belong_to(:team) }
    # have many relation
    # it { should have_many(:user)}
  end
end
