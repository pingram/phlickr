class AddWidthAndHeightToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :o_width, :integer
    add_column :photos, :o_height, :integer
    add_column :photos, :display_width, :integer
    add_column :photos, :display_height, :integer
  end
end