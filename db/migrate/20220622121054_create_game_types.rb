class CreateGameTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :game_types do |t|
      t.string :game_type_title
      t.text :game_type_descr

      t.timestamps
    end
  end
end
