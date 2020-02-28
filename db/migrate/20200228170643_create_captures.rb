class CreateCaptures < ActiveRecord::Migration[6.0]
  def change
    create_table :captures do |t|
      t.references :flag, null: false, foreign_key: true
      t.references :game_state, null: false, foreign_key: true

      t.timestamps
    end
  end
end
