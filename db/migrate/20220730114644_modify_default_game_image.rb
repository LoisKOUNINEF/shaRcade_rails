class ModifyDefaultGameImage < ActiveRecord::Migration[7.0]
  def change
    change_column_default :games, :image_url, "https://iili.io/wGoI3b.png"
  end
end
