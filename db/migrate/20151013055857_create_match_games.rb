class CreateMatchGames < ActiveRecord::Migration
  def change
    create_table :match_games do |t|
      t.references :match, index: true
      t.references :game, index: true
      t.timestamps null: false
    end
  end
end
