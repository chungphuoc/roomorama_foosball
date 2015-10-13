class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :score_1
      t.integer :score_2
      t.timestamps null: false
    end
  end
end
