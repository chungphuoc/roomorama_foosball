module MatchesHelper
  def display_team_member(t)
    t.team_users.map { |e| e.user.full_name }.join(' | ')
  end

  def display_result(m)
    return MatchService.get_result(m)
  end
end
