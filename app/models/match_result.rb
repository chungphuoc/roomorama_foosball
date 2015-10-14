class MatchResult < ActiveRecord::Base
  belongs_to :match
  belongs_to :winner, foreign_key: "winner_id", class_name: "Team"
  belongs_to :loser, foreign_key: "loser_id", class_name: "Team"
end
