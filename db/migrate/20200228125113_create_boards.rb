class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.string :title
      t.references :user, null: false, foreign_key: true
      t.boolean :published
      t.boolean :completed
      t.string :access_token

      t.timestamps
    end
  end
end
