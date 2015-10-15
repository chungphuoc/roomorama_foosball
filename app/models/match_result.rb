class MatchResult < ActiveRecord::Base
  belongs_to :match
  belongs_to :team

  RESULT_WIN = 'Win'
  RESULT_LOSE = 'Lose'
end
