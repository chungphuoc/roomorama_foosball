class Match < ActiveRecord::Base
  belongs_to :team_1, foreign_key: "team_1_id", class_name: "Team"
  belongs_to :team_2, foreign_key: "team_2_id", class_name: "Team"
  has_many :match_games, dependent: :destroy
  has_one :match_result, dependent: :destroy
end
