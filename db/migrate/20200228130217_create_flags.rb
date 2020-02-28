class CreateFlags < ActiveRecord::Migration[6.0]
  def change
    create_table :flags do |t|
      t.string :value_digest
      t.references :flag, null: true, foreign_key: true
      t.references :board, null: false, foreign_key: true

      t.timestamps
    end
  end
end
