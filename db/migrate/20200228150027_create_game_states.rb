class CreateGameStates < ActiveRecord::Migration[6.0]
  def change
    create_table :game_states do |t|
      t.references :team, null: false, foreign_key: true
      t.string :team_type

      t.timestamps
    end
  end
end
