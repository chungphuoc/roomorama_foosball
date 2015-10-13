class AddForeignKeyTeamUser < ActiveRecord::Migration
  def change
    add_foreign_key :teams, :users
  end
end
