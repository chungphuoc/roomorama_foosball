class RemoveUserIdInTeam < ActiveRecord::Migration
  def change
    remove_foreign_key :teams, :users
    remove_column :teams, :user_id
  end
end
