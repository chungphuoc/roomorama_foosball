class CreateMatchResults < ActiveRecord::Migration
  def change
    create_table :match_results do |t|
      t.references :match, index: true
      t.references :winner, references: :teams, index: true
      t.references :loser, references: :teams, index: true
      t.timestamps null: false
    end
  end
end
