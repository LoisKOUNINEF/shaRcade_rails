class AddMobileReadyToGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :mobile_ready, :boolean, default: false
  end
end
