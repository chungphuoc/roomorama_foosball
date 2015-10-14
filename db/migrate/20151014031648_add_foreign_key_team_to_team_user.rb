class AddForeignKeyTeamToTeamUser < ActiveRecord::Migration
  def change
    add_foreign_key :team_users, :teams
  end
end
