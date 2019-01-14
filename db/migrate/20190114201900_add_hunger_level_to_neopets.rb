class AddHungerLevelToNeopets < ActiveRecord::Migration
  def change
    add_column :neopets, :hunger_level, :integer, :default => 10
  end
end
