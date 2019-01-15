class RemoveVeganFromNeopets < ActiveRecord::Migration
  def change
    remove_column :neopets, :vegan, :boolean
  end
end
