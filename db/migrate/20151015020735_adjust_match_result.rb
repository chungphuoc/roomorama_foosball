class AdjustMatchResult < ActiveRecord::Migration
  def change
    remove_reference :match_results, :winner
    remove_reference :match_results, :loser
    add_reference :match_results, :team, index: true
    add_column :match_results, :result, :string
  end
end
