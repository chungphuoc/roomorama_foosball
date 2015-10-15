class MatchService
  def self.create(params)
    @teams = []
    params.each do |team, user_id|
      t = Team.create()
      @teams << t
      user_id.each do |uid|
        TeamUser.create(team: t, user_id: uid.to_i)
      end
    end
    Match.create(team_1_id: @teams[0].id, team_2_id: @teams[1].id)
  end

  def self.update_result(params, match)
    params[:score_1].each_with_index do |score, idx|
      g = Game.create(score_1: score, score_2: params[:score_2][idx])
      MatchGame.create(match: match, game: g)
    end
    result = get_result(match)
    if result[:winner] == 'Team 1'
      t1_result = MatchResult::RESULT_WIN
      t2_result = MatchResult::RESULT_LOSE
    else
      t1_result = MatchResult::RESULT_LOSE
      t2_result = MatchResult::RESULT_WIN
    end
    MatchResult.create(match_id: match.id, team_id: match.team_1_id, result: t1_result)
    MatchResult.create(match_id: match.id, team_id: match.team_2_id, result: t2_result)
  end

  def self.get_result(match)
    flag1, flag2 = 0, 0
    match_games = MatchGame.where(match_id: match.id)
    if match_games.count > 0
      match_games.each do |mg|
        mg.game.score_1.to_i > mg.game.score_2.to_i ? flag1 += 1 : flag2 += 1
      end
      winner = flag1 > flag2 ? 'Team 1' : 'Team 2'
      {team_1: flag1, team_2: flag2, winner: winner, match_id: match.id}
    else
      {team_1: flag1, team_2: flag2, winner: nil, match_id: match.id}
    end
  end
end