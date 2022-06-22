class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|
      t.references :game_type, null: true, foreign_key: true, default: :null
      t.references :game, null: true, foreign_key: true, default: :null
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
