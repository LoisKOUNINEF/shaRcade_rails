class CreateApiCalls < ActiveRecord::Migration[7.0]
  def change
    create_table :api_calls do |t|
      t.string :api_key, null: false
      t.references :game, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
