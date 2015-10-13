class Match < ActiveRecord::Base
  has_many :teams
  has_many :match_games, dependent: :destroy
end
