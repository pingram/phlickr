class CreateFavoritePhotos < ActiveRecord::Migration
  def change
    create_table :favorite_photos do |t|
      t.integer :user_id, null: false
      t.integer :photo_id, null: false

      t.timestamps
    end
    add_index :favorite_photos, :user_id
    add_index :favorite_photos, :photo_id
  end
end
