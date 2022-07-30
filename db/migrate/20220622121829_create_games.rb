class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :game_title
      t.string :game_url
      t.text :game_descr
      t.references :game_type, null: false, foreign_key: true
      t.string :image_url, default: "https://iili.io/wGoI3b.png"

      t.timestamps
    end
  end
end
