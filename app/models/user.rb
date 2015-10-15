class User < ActiveRecord::Base
  has_many :team_users
  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def wins
    total = 0
    self.team_users.each do |tu|
      total += tu.team.match_results.where("match_results.result = ?", MatchResult::RESULT_WIN).count
    end
    total
  end

  def loss
    total = 0
    self.team_users.each do |tu|
      total += tu.team.match_results.where("match_results.result = ?", MatchResult::RESULT_LOSE).count
    end
    total
  end

  def total_matches
    team_users.count
  end

  def percent_win
    "#{(self.wins.to_f / self.total_matches.to_f) * 100}".to_f.round(2)
  end
end
