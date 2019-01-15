class AddPictureLinkToNeopets < ActiveRecord::Migration
  def change
    add_column :neopets, :picture_link, :string
  end
end
