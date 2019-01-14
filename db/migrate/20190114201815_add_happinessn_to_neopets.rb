class AddHappinessnToNeopets < ActiveRecord::Migration
  def change
    add_column :neopets, :happiness, :integer, :default => 200 
  end
end
