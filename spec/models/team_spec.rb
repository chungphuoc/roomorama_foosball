require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'association' do
    # belong to relation
    # it { should belong_to(:match) }
    # have many relation
    it { should have_one(:user)}
  end
end
