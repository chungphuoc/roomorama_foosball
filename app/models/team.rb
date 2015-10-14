class Team < ActiveRecord::Base
  has_many :team_users, dependent: :destroy
  has_one :match
  has_one :match_result, foreign_key: "winner_id", class_name: "MatchResult"
end
