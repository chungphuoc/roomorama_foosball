class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.references :team_1, references: :teams, index: true
      t.references :team_2, references: :teams, index: true
      t.timestamps null: false
    end
  end
end
