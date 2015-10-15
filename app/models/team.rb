class Team < ActiveRecord::Base
  has_many :team_users, dependent: :destroy
  has_one :match
  has_many :match_results
end
