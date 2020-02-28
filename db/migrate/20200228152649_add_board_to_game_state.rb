class AddBoardToGameState < ActiveRecord::Migration[6.0]
  def change
    add_reference :game_states, :board, null: false, foreign_key: true
  end
end
