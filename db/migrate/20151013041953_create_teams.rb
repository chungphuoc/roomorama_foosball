class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.references :user, index: true
      t.timestamps null: false
    end
  end
end
