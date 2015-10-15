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
end
