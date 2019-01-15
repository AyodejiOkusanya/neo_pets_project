class AddMusicTasteToNeopets < ActiveRecord::Migration
  def change
    add_column :neopets, :music_taste, :string
  end
end
